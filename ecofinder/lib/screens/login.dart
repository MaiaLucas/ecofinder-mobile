import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/login/icon.dart';
import '../widgets/login/adaptative_text_field.dart';
import '../widgets/login/sign_button.dart';
import '../widgets/login/login_button.dart';
import '../widgets/login/app_label.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.15),
                Container(
                  height: screenHeight * 0.10,
                  child: AppIcon(),
                ),
                Container(
                  height: screenHeight * 0.3,
                  child: AppLabel(),
                ),
                Container(
                  height: screenHeight * 0.25,
                  width: screenWidth * 0.85,
                  child: Column(
                    children: [
                      AdaptativeTextField(
                        label: 'Usuário',
                        controller: _userController,
                        onSubmitted: null,
                      ),
                      AdaptativeTextField(
                        label: 'Senha',
                        controller: _passwordController,
                        onSubmitted: null,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.3,
                  child: LoginButton(),
                ),
                SignButton(),
                SizedBox(height: screenHeight * 0.1126),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
