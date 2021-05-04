import 'dart:async';
import 'dart:convert';
import 'package:ecofinder/models/User.dart';
import 'package:ecofinder/services/urls.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:ecofinder/utils/store.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class AuthProvider with ChangeNotifier {
  String _userId;
  User _user;
  String _token;
  DateTime _expDate;
  Timer _logoutTimer;

  String _userData = 'userData';
  Map<String, dynamic> _editUser = {
    'email': '',
    'full_name': '',
  };

  String _image = '';

  set image(String image) {
    _image = image;
    notifyListeners();
  }

  set data(Map<String, dynamic> value) {
    _editUser = value;
  }

  set userData(Map<String, dynamic> value) {
    _user = User.fromJson(value);
    notifyListeners();
  }

  bool get isAuth {
    return token != null;
  }

  String get userId {
    return isAuth ? _userId : null;
  }

  User get user {
    return isAuth ? _user : null;
  }

  String get token {
    if (_token != null &&
        _expDate != null &&
        _expDate.isAfter(DateTime.now())) {
      return _token;
    }

    return null;
  }

  Future<void> _authenticate(
    Map<String, dynamic> data,
    String urlSegment,
    BuildContext context,
  ) async {
    Widget snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('Não foi possível entrar! Tente novamente',
          style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
    );
    final response = await http.post(
      Uri.parse("${URLS.BASE_URL}/$urlSegment"),
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );
    final responseBody = jsonDecode(response.body);

    if (responseBody['error'] != null) {
      if (responseBody['error'].runtimeType == String) {
        snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(responseBody['error'],
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        responseBody['error'].map((error) {
          snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(error, style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }).toList();
      }

      throw responseBody['error'];
    }

    _token = responseBody['token'];
    _userId = responseBody['user'];
    _expDate = DateTime.now().add(
      Duration(
        seconds: (responseBody['expiresIn']),
      ),
    );

    Store.saveMap(_userData, {
      'token': _token,
      'userId': _userId,
      "expDate": _expDate.toIso8601String(),
    });

    //armazena as informações do usuário
    await getUser(responseBody['user']);

    // logout automatico
    snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('Seja Bem Vindo!', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    _autoLogout();
    notifyListeners();
    Navigator.pushNamed(context, Routes.DASHBOARD);
    return Future.value();
  }

  Future<void> signup(Map<String, dynamic> data, BuildContext context) async {
    return await _authenticate(data, 'signup', context);
  }

  Future<void> login(Map<String, dynamic> data, BuildContext context) async {
    return await _authenticate(data, 'login', context);
  }

  Future<void> autoLogin() async {
    if (isAuth) return Future.value();

    final userData = await Store.getMap(_userData);

    if (userData == null) return Future.value();

    final expDate = DateTime.parse(userData['expDate']);

    if (expDate.isBefore(DateTime.now())) return Future.value();

    _userId = userData['userId'];
    _token = userData['token'];
    _expDate = expDate;

    //armazena as informações do usuário
    getUser(_userId);
    // logout automatico
    _autoLogout();
    notifyListeners();

    return Future.value();
  }

  void logout() {
    _token = null;
    _userId = null;
    _expDate = null;

    if (_logoutTimer != null) {
      _logoutTimer.cancel();
      _logoutTimer = null;
    }

    Store.remove(_userData);
    notifyListeners();
  }

  void _autoLogout() {
    if (_logoutTimer != null) {
      _logoutTimer.cancel();
    }

    final timeToLogout = _expDate.difference(DateTime.now()).inSeconds;

    _logoutTimer = Timer(Duration(seconds: timeToLogout), logout);
  }

  Future<void> getUser(String id) async {
    final response = await http.get(
      Uri.parse("${URLS.BASE_URL}/user/$id"),
    );

    final responseBody = jsonDecode(response.body);
    if (responseBody['error'] != null) {
      throw responseBody['message'];
    }
    _user = User.fromJson(responseBody);
  }

  Future<void> editUser(BuildContext context) async {
    final url = Uri.parse("${URLS.BASE_URL}/user/$_userId");
    final streamedRequest = http.MultipartRequest('PUT', url);
    streamedRequest.headers.addAll({"Content-Type": "multipart/form-data"});

    if (_image.isNotEmpty) {
      final mimeTypeData =
          lookupMimeType(_image, headerBytes: [0xFF, 0xD8]).split('/');

      print(mimeTypeData);

      final image = await http.MultipartFile.fromPath(
        'avatar',
        _image,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
      );
      streamedRequest.files.add(image);
    }

    streamedRequest.fields['email'] = _editUser['email'];
    streamedRequest.fields['full_name'] = _editUser['full_name'];

    try {
      final streamedResponse = await streamedRequest.send();
      final response = await http.Response.fromStream(streamedResponse);

      final responseBody = jsonDecode(response.body);

      if (response.statusCode != 200 && responseBody['error']) {
        throw responseBody['error'];
      }

      await getUser(_userId);

      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }
}
