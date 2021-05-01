import 'dart:convert';
import 'dart:developer';

import 'package:ecofinder/services/urls.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  int _currentStep = 2;

  set createPlace(Map<String, dynamic> value) {
    _createPlace = value;
    notifyListeners();
  }

  set step(int newStep) {
    _currentStep = newStep;
    notifyListeners();
  }

  Map<String, dynamic> get createPlaceContent {
    return _createPlace;
  }

  get currentStep {
    return _currentStep;
  }

  Future<void> create(context) async {
    try {
      final response = await http.post(
        "${URLS.BASE_URL}/place",
        body: jsonEncode(_createPlace),
        headers: {"Content-Type": "application/json"},
      );

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

    // print(responseBody);
  }
}
