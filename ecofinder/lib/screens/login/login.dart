import 'dart:convert';

import 'package:ecofinder/services/api.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _submitForm(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;

    ApiService.signIn({"email": email, "password": password}).then((res) {
      var data = jsonDecode(res.body);

      print(data);

      if (res.statusCode != 200) {
        final snackBar = SnackBar(
          content: Text(data['message']),
          backgroundColor: Colors.red,
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      } else {
        Navigator.pushNamed(context, Routes.DASHBOARD);
      }
    }).catchError((err) {
      print('erro');
      print(err);
    });
  }

  bool notVisible = true;
  bool emailLength = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/ecofinderlogo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _emailController,
                onChanged: (value) {
                  setState(() {
                    emailLength = value.length > 0 ? true : false;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                  suffixIcon: emailLength
                      ? IconButton(
                          onPressed: () => _emailController.clear(),
                          icon: Icon(Icons.clear),
                        )
                      : null,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: notVisible,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => notVisible = !notVisible);
                    },
                    icon: Icon(
                        notVisible ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.REGISTER);
                      },
                      child: Text('Cadastre-se'),
                    ),
                    ButtonTheme(
                      minWidth: 100,
                      height: 50,
                      child: RaisedButton(
                        padding: const EdgeInsets.all(5),
                        color: Colors.teal[500],
                        onPressed: () {
                          _submitForm(context);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
