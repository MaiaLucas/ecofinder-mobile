import 'package:ecofinder/screens/profile/index.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashMenu extends StatefulWidget {
  @override
  _DashMenuState createState() => _DashMenuState();
}

class _DashMenuState extends State<DashMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      body: SafeArea(child: Profile()),
    );
  }
}
