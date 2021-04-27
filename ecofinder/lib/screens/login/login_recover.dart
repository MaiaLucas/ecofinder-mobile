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
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 240,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/tree.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Informe o e-mail ligado à sua conta, um link de redefinição de senha será enviado.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15, color: Colors.white54),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "E-mail",
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: screenWidth * 0.5,
                height: screenHeight * 0.05,
                child: ElevatedButton(
                  child: Text(
                    'Recuperar senha',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
