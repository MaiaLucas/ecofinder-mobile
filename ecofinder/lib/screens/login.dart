import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Ícone!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            Text(
              'Ecofinder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Platform.isIOS
                ? CupertinoTextField(
                    controller: _userController,
                    placeholder: 'Usuário',
                  )
                : TextField(
                    controller: _userController,
                    decoration: InputDecoration(labelText: 'Usuário'),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
            Platform.isIOS
                ? CupertinoTextField(
                    controller: _passwordController,
                    placeholder: 'Senha',
                  )
                : TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Senha'),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
            Platform.isIOS
                ? CupertinoButton(
                    color: Colors.green,
                    child: Text('Entrar'),
                    onPressed: null,
                  )
                : FloatingActionButton(
                    backgroundColor: Colors.green,
                    child: Text('Entrar'),
                    onPressed: null,
                  ),
            Text(
              'Novo aqui? Crie sua conta!',
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
