import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ecofinder/utils/routes.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      builder: null,
      converter: (store) => print(store),
    );
  }
}
