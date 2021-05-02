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
    'title': 'a',
    'type': 1,
    'description': 'a',
    'phone': 'a',
    'address': 'a',
    'city': 'a',
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

  Future<http.StreamedResponse> create(BuildContext context) async {
    print('ok');
    final requestUrl = Uri.parse("${URLS.BASE_URL}/place");
    final mimeTypeData =
        lookupMimeType(_images[0], headerBytes: [0xFF, 0xD8]).split('/');

    final imageUploaderRequest = http.MultipartRequest('POST', requestUrl);

    final images = await http.MultipartFile.fromPath(
      'images',
      _images[0],
      contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
    );

    imageUploaderRequest.files.add(images);
    imageUploaderRequest.headers
        .addAll({"Content-Type": "multipart/form-data"});
    imageUploaderRequest.fields['type'] = _createPlace['type'].toString();
    imageUploaderRequest.fields['title'] = _createPlace['title'];
    imageUploaderRequest.fields['description'] = _createPlace['description'];
    imageUploaderRequest.fields['phone'] = _createPlace['phone'];
    imageUploaderRequest.fields['address'] = _createPlace['address'];
    imageUploaderRequest.fields['city'] = _createPlace['city'];
    imageUploaderRequest.fields['open_on_weekend'] =
        _createPlace['open_on_weekend'].toString();
    imageUploaderRequest.fields['hr_init'] = _createPlace['hr_init'];
    imageUploaderRequest.fields['hr_final'] = _createPlace['hr_final'];
    try {
      final streamedResponse = await imageUploaderRequest.send();

      final response = await http.Response.fromStream(streamedResponse);

      final responseBody = jsonDecode(response.body);

      if (response.statusCode != 200 && responseBody['error'])
        throw responseBody['error'];

      Navigator.pushNamed(context, Routes.CONFIRMATION);
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
