//import 'dart:convert';

import 'package:ecofinder/services/api.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/services.dart';

class LoginRecover extends StatefulWidget {
  @override
  _LoginRecoverState createState() => _LoginRecoverState();
}

class _LoginRecoverState extends State<LoginRecover> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController _emailController = TextEditingController();

    Widget snackBar = SnackBar(
      content: Text('Houve um erro! Tente novamente'),
      backgroundColor: Colors.red,
    );

    Future<bool> isFetching() async {
      await new Future.delayed(const Duration(seconds: 2));
      return true;
    }

    handleSubmit() async {
      String email = _emailController.text;

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });

      try {
        final payload = await ApiService.recover(email);

        await isFetching();
        Navigator.pop(context);

        FocusManager.instance.primaryFocus.unfocus();

        if (payload['error'] != null) throw payload['error'];

        snackBar = SnackBar(
          content: Text(
            payload['message'],
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        );
      } catch (e) {
        snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            e,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        );
      }

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

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
          child: SingleChildScrollView(
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
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-mail",
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                    onPressed: handleSubmit,
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
