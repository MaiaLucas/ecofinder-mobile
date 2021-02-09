import 'package:ecofinder/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class LoginButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const LoginButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Colors.pink[700],
            child: Text(label),
            onPressed: onPressed,
          )
        : RaisedButton(
            onPressed: () {
              String email = "api@ecofinder.com";
              String password = "AP1@ecofinder";
              ApiService.signIn(email, password);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
            padding: const EdgeInsets.all(0),
            child: Ink(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.teal,
                    Colors.green,
                    Colors.teal,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Container(
                constraints: const BoxConstraints(
                  minWidth: 150,
                  minHeight: 50,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
  }
}
