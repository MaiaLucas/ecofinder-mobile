import 'package:ecofinder/components/templates/Search.dart';
import 'package:ecofinder/services/api.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';

class DashSearch extends StatefulWidget {
  @override
  _DashSearchState createState() => _DashSearchState();
}

class _DashSearchState extends State<DashSearch> {
  final _searchValueController = TextEditingController();
  String searchType = "";
  List<dynamic> listPlaces = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void handleChangeType(int type) {
    print(searchType);
    setState(() {
      if (searchType.isNotEmpty) {
        if (searchType == type.toString())
          searchType = "";
        else
          searchType = type.toString();
      } else {
        searchType = type.toString();
      }
      print(searchType);
    });
  }

  void search() async {
    final searchValue = _searchValueController.text;
    final searchList =
        await ApiService.searchPlace(city: searchValue, type: searchType);
    setState(() {
      listPlaces = searchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      body: SafeArea(
          child: Search(
        listOfValues: listPlaces,
        router: Routes.PLACEDETAIL,
        search: {
          "method": search,
          "controller": _searchValueController,
          "type": searchType,
          "methodType": handleChangeType
        },
        hasOptions: true,
      )),
    );
  }
}
