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
        : Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: RaisedButton(
              onPressed: () {},
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
                    minWidth: 88,
                    minHeight: 36,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
  }
}
