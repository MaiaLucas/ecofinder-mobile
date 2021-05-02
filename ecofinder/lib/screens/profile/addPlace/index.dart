import 'package:ecofinder/providers/place.dart';
import 'package:ecofinder/screens/profile/addPlace/place_step1.dart';
import 'package:ecofinder/screens/profile/addPlace/place_step2.dart';
import 'package:ecofinder/screens/profile/addPlace/place_step3.dart';
import 'package:ecofinder/screens/profile/addPlace/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:provider/provider.dart';

class AddPlace extends StatefulWidget {
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  @override
  Widget build(BuildContext context) {
    PlaceProvider placeProvider = Provider.of(context);
    final deviceSize = MediaQuery.of(context).size;

    List<Widget> steps = [
      PlaceStep1(),
      PlaceStep2(),
      PlaceStep3(),
      Confirmation(),
    ];

    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      appBar: AppBar(
        title: Text("Cadastrar novo local"),
        backgroundColor: Constants.TOPBOTTOM,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 0.2,
                    image: AssetImage('assets/map.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: deviceSize.height * 0.015),
              steps[placeProvider.currentStep]
            ],
          ),
        ),
      ),
    );
  }
}
