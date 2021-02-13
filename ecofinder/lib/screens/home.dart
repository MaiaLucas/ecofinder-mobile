import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ecofinder/utils/routes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final _userController = TextEditingController();
  //final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    //double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/login.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.15,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    blurRadius: 30,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: ButtonTheme(
                minWidth: 120,
                height: 85,
                child: RaisedButton(
                  padding: const EdgeInsets.all(5),
                  color: Colors.teal[500],
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.LOGIN);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white70,
                    size: 45,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
