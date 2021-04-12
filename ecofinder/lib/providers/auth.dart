import 'dart:async';
import 'dart:convert';
import 'package:ecofinder/services/urls.dart';
import 'package:ecofinder/utils/store.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _userId;
  String _token;
  DateTime _expDate;
  Timer _logoutTimer;

  String _userData = 'userData';

  bool get isAuth {
    return token != null;
  }

  String get userId {
    return isAuth ? _userId : null;
  }

  String get token {
    if (_token != null &&
        _expDate != null &&
        _expDate.isAfter(DateTime.now())) {
      return _token;
    }

    return null;
  }

  /**
   * Responsável pela autenticação do usuário
   */
  Future<void> _authenticate(
      Map<String, dynamic> data, String urlSegment) async {
    final response = await http.post(
      "${URLS.BASE_URL}/$urlSegment",
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );

    final responseBody = jsonDecode(response.body);
    if (responseBody['error'] != null) {
      throw responseBody['message'];
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

    // logout automatico
    _autoLogout();
    notifyListeners();

    return Future.value();
  }

  Future<void> signup(Map<String, dynamic> data) async {
    return await _authenticate(data, 'signup');
  }

  Future<void> login(Map<String, dynamic> data) async {
    return await _authenticate(data, 'login');
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
}