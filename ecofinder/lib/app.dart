import 'package:ecofinder/screens/dashboard/dashboard.dart';
import 'package:ecofinder/screens/home.dart';
import 'package:ecofinder/screens/login/login.dart';
import 'package:ecofinder/screens/login/login_recover.dart';
import 'package:ecofinder/screens/login/register.dart';
import 'package:ecofinder/screens/place/detail.dart';
import 'package:ecofinder/screens/product/detail.dart';
import 'package:ecofinder/screens/profile/detail.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'screens/profile/addPlace/place_step1.dart';
import 'screens/profile/addPlace/place_step2.dart';
import 'screens/profile/addPlace/place_step3.dart';
import 'screens/profile/addPlace/place_step4.dart';
import 'screens/profile/addProduct/product_step1.dart';
import 'screens/profile/addProduct/product_step2.dart';
import 'screens/profile/addProduct/product_step3.dart';

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
        Routes.HOME: (ctx) => Home(),
        Routes.LOGIN: (ctx) => Login(),
        Routes.DASHBOARD: (ctx) => Dashboard(),
        Routes.REGISTER: (ctx) => Register(),
        Routes.PLACEDETAIL: (ctx) => PlaceDetail(),
        Routes.PRODUCTDETAIL: (ctx) => ProductDetail(),
        Routes.PROFILEDETAIL: (ctx) => ProfileDetail(),
        Routes.PLACESTEP1: (ctx) => PlaceStep1(),
        Routes.PLACESTEP2: (ctx) => PlaceStep2(),
        Routes.PLACESTEP3: (ctx) => PlaceStep3(),
        Routes.PRODUCTSTEP1: (ctx) => ProductStep1(),
        Routes.PRODUCTSTEP2: (ctx) => ProductStep2(),
        Routes.PRODUCTSTEP3: (ctx) => ProductStep3(),
        Routes.PLACESTEP4: (ctx) => PlaceStep4(),
        Routes.LOGINRECOVER: (ctx) => LoginRecover(),
      },
    );
  }
}
