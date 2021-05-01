import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/like.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Text(
                "Seu local foi cadastrado com sucesso!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              Container(
                width: screenWidth * 0.77,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  child: Text('Entendido!', style: TextStyle(fontSize: 25)),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
