import 'package:ecofinder/providers/place.dart';
import 'package:ecofinder/screens/profile/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceStep1 extends StatefulWidget {
  @override
  _PlaceStep1State createState() => _PlaceStep1State();
}

class _PlaceStep1State extends State<PlaceStep1> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    PlaceProvider placeProvider = Provider.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    String title = '', description = '', phone = '';

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
              TextFormField(
                controller: initialValue(content['title']),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo é obrigatório';
                  }
                  return null;
                },
                onSaved: (String val) {
                  title = val;
                },
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Container(
                child: TextFormField(
                  controller: initialValue(content['description']),
                  maxLines: 5,
                  onSaved: (String val) {
                    description = val;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: "Descrição",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              TextFormField(
                controller: initialValue(content['phone']),
                onSaved: (String val) {
                  setState(() {
                    phone = val;
                  });
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Número para contato',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              Buttons(
                isValid: () {
                  return _formKey.currentState.validate();
                },
                stepContent: () {
                  _formKey.currentState.save();
                  Map<String, dynamic> stepContent = {
                    'title': title,
                    'description': description,
                    'phone': phone,
                  };

                  return stepContent;
                },
                hasBackButton: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
