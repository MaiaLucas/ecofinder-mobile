import 'dart:convert';

import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Search extends StatefulWidget {
  final Map<String, dynamic> search;
  final List<dynamic> listOfValues;
  final bool hasOptions;
  final dynamic router;
  const Search({
    Key key,
    @required this.search,
    @required this.listOfValues,
    @required this.router,
    this.hasOptions = false,
  }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Color colorEColeta = Color(0xFF004b23);
  Color colorXP = Color(0xFF004b23);
  Color optionSelected = Color(0xFF3da35d);

  Widget getImage(dynamic image) {
    dynamic url = "";
    if (image['images_url'].runtimeType == String) {
      if (!jsonDecode(image['images_url']).isEmpty ?? true) {
        url = jsonDecode(image['images_url'])['images'].length > 0
            ? jsonDecode(image['images_url'])['images'][0]['path']
            : "";
      }
    } else {
      if (!(image['images_url']).isEmpty ?? true) {
        url = image['images_url']['images'].length > 0
            ? image['images_url']['images'][0]['path']
            : "";
      }
    }

    return Container(
      width: 60,
      height: 50,
      color: Colors.green,
      child: url.length > 0
          ? Image.network(
              url,
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
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
                          controller: widget.search['controller'],
                          onChanged: (_) {
                            widget.search['method']();
                          },
                          cursorColor: Colors.white70,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: "Digite aqui a cidade que busca...",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          onPressed: () {
                            widget.search['method']();
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
        widget.hasOptions
            ? Row(
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
                        widget.search['methodType'](1);
                        colorEColeta = colorEColeta == Color(0xFF004b23)
                            ? optionSelected
                            : Color(0xFF004b23);
                        colorXP = Color(0xFF004b23);
                      });
                      widget.search['method']();
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
                        widget.search['methodType'](2);
                        colorXP = colorXP == Color(0xFF004b23)
                            ? optionSelected
                            : Color(0xFF004b23);
                        colorEColeta = Color(0xFF004b23);
                      });
                      widget.search['method']();
                    },
                  ),
                ],
              )
            : Text(""),
        SizedBox(
          height: 8,
        ),
        widget.listOfValues.length > 0
            ? Expanded(
                child: ListView.builder(
                  itemCount: widget.listOfValues.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          widget.router,
                          arguments: {'id': widget.listOfValues[index]['id']},
                        );
                      },
                      leading: getImage(widget.listOfValues[index]),
                      title: Text(
                        widget.listOfValues[index]['title'],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              widget.listOfValues[index]['rating'].toString(),
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
            : Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.2),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/search.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Vamos começar nossa busca!',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
