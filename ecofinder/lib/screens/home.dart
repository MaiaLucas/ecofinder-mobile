import 'package:ecofinder/providers/auth.dart';
import 'package:ecofinder/screens/dashboard/dashboard.dart';
import 'package:ecofinder/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of(context);
    return FutureBuilder(
      future: auth.autoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (snapshot.error != null)
          return Center(
            child: Text('Ops! Ocorreu um erro'),
          );

        return auth.isAuth ? Dashboard() : Login();
      },
    );
  }
}
