import 'package:ecofinder/models/User.dart';
import 'package:ecofinder/screens/profile/index.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecofinder/providers/auth.dart';

class DashMenu extends StatefulWidget {
  @override
  _DashMenuState createState() => _DashMenuState();
}

class _DashMenuState extends State<DashMenu> {
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of(context);
    User user = auth.user;
    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      body: SafeArea(
          child: user == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Profile()),
    );
  }
}
