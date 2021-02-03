import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Ícone!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    );
  }
}
