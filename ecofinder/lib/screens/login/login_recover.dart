import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';

class LoginRecover extends StatefulWidget {
  @override
  _LoginRecoverState createState() => _LoginRecoverState();
}

class _LoginRecoverState extends State<LoginRecover> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      appBar: AppBar(
        title: Text("Recuperação de senha"),
        backgroundColor: Constants.TOPBOTTOM,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Caso tenha esquecido sua senha basta nos informar o e-mail vinculado a sua conta que iremos enviar uma soliticação de troca de senha!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white54)),
                SizedBox(height: screenHeight * 0.2),
                Text(
                  "Insira aqui o e-mail:",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.05,
                  child: ElevatedButton(
                    child: Text(
                      'Enviar!',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
