import 'package:flutter/material.dart';

class AppLabel extends StatelessWidget {
  const AppLabel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      alignment: Alignment.center,
      child: Text(
        'Ecofinder',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
