import 'package:ecofinder/screens/profile/userRegister/register_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      appBar: AppBar(
        title: Text("Cadastros"),
        centerTitle: true,
        backgroundColor: Constants.TOPBOTTOM,
      ),
      body: ListView(
        children: [
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
          RegisterCard(),
        ],
      ),
    );
  }
}
