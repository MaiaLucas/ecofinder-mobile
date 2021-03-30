import 'package:ecofinder/screens/dashboard/dashboard.dart';
import 'package:ecofinder/screens/login/login.dart';
import 'package:ecofinder/screens/login/register.dart';
import 'package:ecofinder/screens/place/detail.dart';
import 'package:ecofinder/screens/product/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecofinder',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF004b23),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        Routes.HOME: (ctx) => Dashboard(),
        Routes.LOGIN: (ctx) => Login(),
        Routes.DASHBOARD: (ctx) => Dashboard(),
        Routes.REGISTER: (ctx) => Register(),
        Routes.PLACEDETAIL: (ctx) => PlaceDetail(),
        Routes.PRODUCTDETAIL: (ctx) => ProductDetail(),
      },
    );
  }
}
