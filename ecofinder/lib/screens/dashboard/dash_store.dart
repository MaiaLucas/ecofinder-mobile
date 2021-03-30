import 'dart:convert';

import 'package:ecofinder/components/templates/Search.dart';
import 'package:ecofinder/services/api.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/material.dart';

class DashStore extends StatefulWidget {
  @override
  _DashStoreState createState() => _DashStoreState();
}

class _DashStoreState extends State<DashStore> {
  final _searchValueController = TextEditingController();
  List<dynamic> productsList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void handleChange() async {
    final searchValue = _searchValueController.text;
    final searchList = await ApiService.searchProduct(products: searchValue);
    setState(() {
      productsList = searchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.BACKGROUND,
        body: SafeArea(
          child: Search(
            listOfValues: productsList,
            search: {
              "method": handleChange,
              "controller": _searchValueController
            },
            router: Routes.PRODUCTDETAIL,
          ),
        ));
  }
}
