import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:ecofinder/services/urls.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

class ProductProvider with ChangeNotifier {
  Map<String, dynamic> _createProduct = {
    'title': 'a',
    'description': 'a',
    'price': 0,
    'facebook_link': '',
    'instagram_account': ''
  };

  List<String> _images = [];

  int _currentStep = 0;

  set image(String image) {
    _images.add(image);
    notifyListeners();
  }

  set object(Map<String, dynamic> value) {
    _createProduct = {...createObject, ...value};
    notifyListeners();
  }

  set step(int newStep) {
    _currentStep = newStep;
    notifyListeners();
  }

  Map<String, dynamic> get createObject {
    return _createProduct;
  }

  get currentStep {
    return _currentStep;
  }

  get imageList {
    return _images;
  }

  void _resetProductObj() {
    object = {
      'title': 'a',
      'description': 'a',
      'price': 0,
      'facebook_link': '',
      'instagram_account': ''
    };
  }

  Future<http.StreamedResponse> create(context) async {
    final requestUrl = Uri.parse("${URLS.BASE_URL}/product");
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
    imageUploaderRequest.fields['title'] = _createProduct['title'];
    imageUploaderRequest.fields['description'] = _createProduct['description'];
    imageUploaderRequest.fields['price'] = _createProduct['price'].toString();
    imageUploaderRequest.fields['facebook_link'] =
        _createProduct['facebook_link'];
    imageUploaderRequest.fields['instagram_account'] =
        _createProduct['instagram_account'];
    try {
      final streamedResponse = await imageUploaderRequest.send();
      http.Response.fromStream(streamedResponse);

      final apiResponse = await http.post(
        requestUrl,
        body: jsonEncode(_createProduct),
        headers: {"Content-Type": "application/json"},
      );

      final responseBody = jsonDecode(apiResponse.body);

      if (apiResponse.statusCode != 200 && responseBody['error'])
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
