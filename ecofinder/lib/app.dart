import 'package:ecofinder/screens/dashboard/dashboard.dart';
import 'package:ecofinder/screens/home.dart';
import 'package:ecofinder/screens/login/login.dart';
import 'package:ecofinder/screens/login/login_recover.dart';
import 'package:ecofinder/screens/login/register.dart';
import 'package:ecofinder/screens/place/detail.dart';
import 'package:ecofinder/screens/product/detail.dart';
import 'package:ecofinder/screens/profile/addPlace/index.dart';
import 'package:ecofinder/screens/profile/addPlace/confirmation.dart';
import 'package:ecofinder/screens/profile/addProduct/index.dart';
import 'package:ecofinder/screens/profile/detail.dart';
import 'package:ecofinder/screens/profile/userRegister/user_register.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

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
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Color(0xFF73a942),
            side: BorderSide(color: Color(0xFF73a942), width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF004b23),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
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
        Routes.PLACEDETAIL: (ctx) => PlaceDetail(),
        Routes.PRODUCTDETAIL: (ctx) => ProductDetail(),
        Routes.PROFILEDETAIL: (ctx) => ProfileDetail(),
        Routes.ADDPLACE: (ctx) => AddPlace(),
        Routes.ADDPRODUCT: (ctx) => AddProduct(),
        Routes.CONFIRMATION: (ctx) => Confirmation(),
        Routes.LOGINRECOVER: (ctx) => LoginRecover(),
        Routes.USERREGISTER: (ctx) => UserRegister(),
      },
    );
  }
}
