import 'package:flutter/material.dart';

class PlaceProvider with ChangeNotifier {
  Map<String, dynamic> _createPlace = {
    'title': '',
    'description': '',
    'phone': '',
    'adress': '',
    'city': '',
    'open_on_weekend': '',
    'hr_init': '',
    'hr_final': '',
  };

  int _currentStep = 0;

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
}
