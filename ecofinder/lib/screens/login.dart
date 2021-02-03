import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/icon.dart';
import '../widgets/adaptative_text_field.dart';
import '../widgets/sign_button.dart';
import '../widgets/login_button.dart';
import '../widgets/app_label.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: ListView(
          padding: EdgeInsets.only(top: 70, left: 30, right: 30),
          children: [
            AppIcon(),
            AppLabel(),
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
            LoginButton(),
            SignButton(),
          ],
        ),
      ),
    );
  }
}
