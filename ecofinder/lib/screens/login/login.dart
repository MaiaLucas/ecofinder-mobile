//import 'dart:convert';

import 'package:ecofinder/providers/auth.dart';
//import 'package:ecofinder/services/api.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _submitForm(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    Map<String, dynamic> data = {"email": email, "password": password};

    AuthProvider auth = Provider.of(context, listen: false);

    try {
      await auth.login(data, context);
      // Navigator.pushNamed(context, Routes.DASHBOARD);
    } catch (error) {
      final snackBar = SnackBar(
        content: Text(error['message']),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  bool notVisible = true;
  bool emailLength = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Constants.BACKGROUND,
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.055,
                      child: ElevatedButton(
                        child: Text('Entrar', style: TextStyle(fontSize: 25)),
                        onPressed: () {
                          _submitForm(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.LOGINRECOVER);
                },
                child: Text('Esqueceu sua senha?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
