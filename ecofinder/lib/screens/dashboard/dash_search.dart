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
  Color colorEColeta = Color(0xFF004b23);
  Color colorXP = Color(0xFF004b23);
  Color optionSelected = Color(0xFF3da35d);
  List<dynamic> listPlaces = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void search() async {
    final searchValue = _searchValueController.text;
    print('searchType ' + searchType);
    final searchList =
        await ApiService.searchPlace(city: searchValue, type: searchType);
    print(searchList);
    setState(() {
      listPlaces = searchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 15,
                    left: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Constants.TOPBOTTOM,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchValueController,
                              cursorColor: Colors.white70,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.go,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  hintText:
                                      "Digite aqui a cidade que busca..."),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: IconButton(
                              onPressed: () {
                                search();
                              },
                              icon: Icon(
                                CupertinoIcons.search,
                                size: 27,
                              ),
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('E-Coleta'),
                  style: ElevatedButton.styleFrom(
                    primary: colorEColeta,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.40, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      searchType = colorEColeta == Color(0xFF004b23) ? "1" : "";
                      colorEColeta = colorEColeta == Color(0xFF004b23)
                          ? optionSelected
                          : Color(0xFF004b23);
                      colorXP = Color(0xFF004b23);
                    });
                  },
                ),
                ElevatedButton(
                  child: Text('Experiências'),
                  style: ElevatedButton.styleFrom(
                    primary: colorXP,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.40, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      searchType = colorXP == Color(0xFF004b23) ? "2" : "";
                      colorXP = colorXP == Color(0xFF004b23)
                          ? optionSelected
                          : Color(0xFF004b23);
                      colorEColeta = Color(0xFF004b23);
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            listPlaces.length > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: listPlaces.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            print(listPlaces[index]['id']);
                            Navigator.pushNamed(
                              context,
                              Routes.PLACEDETAIL,
                              arguments: {'id': listPlaces[index]['id']},
                            );
                          },
                          leading: Container(
                              width: 60,
                              height: 50,
                              color: Colors.green,
                              child: listPlaces[index]['images_url']?.isEmpty
                                  ? null
                                  : Image.network(
                                      listPlaces[index]['images_url']['images']
                                          [0]['path'],
                                    )),
                          title: Text(
                            listPlaces[index]['title'],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  listPlaces[index]['rating'].toString(),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                CupertinoIcons.star_fill,
                                color: Color(0xFFF6C209),
                                size: 20,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Text('Vamos começar nossa busca!'),
                  ),
          ],
        ),
      ),
    );
  }
}
