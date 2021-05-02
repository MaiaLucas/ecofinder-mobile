import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:ecofinder/services/urls.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

class PlaceProvider with ChangeNotifier {
  Map<String, dynamic> _createPlace = {
    'title': '',
    'type': 1,
    'description': '',
    'phone': '',
    'address': '',
    'city': '',
    'open_on_weekend': true,
    'hr_init': '',
    'hr_final': '',
  };

  List<String> _images = [];

  int _currentStep = 0;

  set image(String image) {
    _images.add(image);
    notifyListeners();
  }

  get imageList {
    return _images;
  }

  set object(Map<String, dynamic> value) {
    _createPlace = {...createObject, ...value};
    notifyListeners();
  }

  set step(int newStep) {
    _currentStep = newStep;
    notifyListeners();
  }

  Map<String, dynamic> get createObject {
    return _createPlace;
  }

  get currentStep {
    return _currentStep;
  }

  void _resetProductObj() {
    object = {
      'title': '',
      'type': 1,
      'description': '',
      'phone': '',
      'address': '',
      'city': '',
      'open_on_weekend': true,
      'hr_init': '',
      'hr_final': '',
    };
    step = 0;
  }

  Future<http.StreamedResponse> create(BuildContext context) async {
    final requestUrl = Uri.parse("${URLS.BASE_URL}/place");
    final streamedRequest = http.MultipartRequest('POST', requestUrl);
    streamedRequest.headers.addAll({"Content-Type": "multipart/form-data"});

    if (_images.isNotEmpty) {
      print('tem image');
      final mimeTypeData =
          lookupMimeType(_images[0], headerBytes: [0xFF, 0xD8]).split('/');

      final images = await http.MultipartFile.fromPath(
        'images',
        _images[0],
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
      );
      await streamedRequest.files.add(images);
    }

    streamedRequest.fields['type'] = _createPlace['type'].toString();
    streamedRequest.fields['title'] = _createPlace['title'];
    streamedRequest.fields['description'] = _createPlace['description'];
    streamedRequest.fields['phone'] = _createPlace['phone'];
    streamedRequest.fields['address'] = _createPlace['address'];
    streamedRequest.fields['city'] = _createPlace['city'];
    streamedRequest.fields['open_on_weekend'] =
        _createPlace['open_on_weekend'].toString();
    streamedRequest.fields['hr_init'] = _createPlace['hr_init'];
    streamedRequest.fields['hr_final'] = _createPlace['hr_final'];
    try {
      final streamedResponse = await streamedRequest.send();

      final response = await http.Response.fromStream(streamedResponse);

      final responseBody = jsonDecode(response.body);

      if (response.statusCode != 200 && responseBody['error'])
        throw responseBody['error'];

      Navigator.pushNamed(context, Routes.CONFIRMATION);
      _resetProductObj();
    } catch (e) {
      Widget snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          e != null
              ? e
              : 'Não foi possível cadastrar! Tente novamente mais tarde',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
