import 'dart:convert';

import 'package:ecofinder/providers/auth.dart';
import 'package:ecofinder/services/api.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _submitForm(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final firstName = _firstNameController.text;

    Map<String, dynamic> data = {
      "email": email,
      "password": password,
      "full_name": firstName,
      "confirm_password": confirmPassword
    };
    AuthProvider auth = Provider.of(context, listen: false);

    try {
      await auth.signup(data);
      Navigator.pushNamed(context, Routes.DASHBOARD);
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          color: Constants.BACKGROUND,
          height: screenHeight,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight * 0.13,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ecofinderlogo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.055),
                //SizedBox(height: 50),
                TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: screenHeight * 0.011),
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
                SizedBox(height: screenHeight * 0.011),
                //SizedBox(height: 10),
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
                SizedBox(height: screenHeight * 0.011),
                //SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: notVisible,
                  decoration: InputDecoration(
                    labelText: 'Confirmar senha',
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
                SizedBox(height: screenHeight * 0.018),
                //SizedBox(height: 10),
                Container(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.07,
                  child: ElevatedButton(
                    child: Text('Cadastrar', style: TextStyle(fontSize: 25)),
                    onPressed: () {
                      _submitForm(context);
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.07),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.LOGIN);
                  },
                  child: Text('Já tem conta? Faça login!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
