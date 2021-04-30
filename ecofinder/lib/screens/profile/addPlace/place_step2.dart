import 'package:ecofinder/providers/place.dart';
import 'package:ecofinder/screens/profile/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:provider/provider.dart';

class PlaceStep2 extends StatefulWidget {
  @override
  _PlaceStep2State createState() => _PlaceStep2State();
}

class _PlaceStep2State extends State<PlaceStep2> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    PlaceProvider placeProvider = Provider.of(context);
    String city = '', address = '', type;

    final content = placeProvider.createPlaceContent;

    initialValue(val) {
      return TextEditingController(text: val);
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField<String>(
                value: type,
                dropdownColor: Constants.TOPBOTTOM,
                isExpanded: true,
                hint: Text('Tipo do local'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo é obrigatório';
                  }
                  return null;
                },
                items: <Map<String, dynamic>>[
                  {'type': 2, 'name': 'Experiência'},
                  {'type': 1, 'name': 'Ponto de Coleta'}
                ].map((Map<String, dynamic> option) {
                  return DropdownMenuItem<String>(
                    value: option['type'].toString(),
                    child: Text(option['name']),
                  );
                }).toList(),
                onChanged: (_) {},
                onSaved: (String val) {
                  setState(() {
                    type = val;
                  });
                },
              ),
              SizedBox(height: screenHeight * 0.015),
              TextFormField(
                controller: initialValue(content['city']),
                onSaved: (String val) {
                  setState(() {
                    city = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Cidade',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo é obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.015),
              TextFormField(
                controller: initialValue(content['address']),
                decoration: InputDecoration(
                  labelText: 'Endereço completo',
                  border: OutlineInputBorder(),
                ),
                onSaved: (String val) {
                  setState(() {
                    address = val;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo é obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.06),
              Buttons(
                isValid: () {
                  return _formKey.currentState.validate();
                },
                stepContent: () {
                  _formKey.currentState.save();
                  Map<String, dynamic> stepContent = {
                    'type': type,
                    'city': city,
                    'address': address,
                  };

                  return stepContent;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
