import 'package:ecofinder/screens/dashboard.dart';
import 'package:ecofinder/screens/login.dart';
import 'package:ecofinder/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './utils/routes.dart';
import './screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecofinder',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        Routes.HOME: (ctx) => Home(),
        Routes.LOGIN: (ctx) => Login(),
        Routes.DASHBOARD: (ctx) => Dashboard(),
        Routes.REGISTER: (ctx) => Register(),
      },
    );
  }
}
