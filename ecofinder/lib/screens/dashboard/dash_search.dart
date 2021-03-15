import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';

class DashSearch extends StatefulWidget {
  @override
  _DashSearchState createState() => _DashSearchState();
}

class _DashSearchState extends State<DashSearch> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> lista = [
      {
        "mainImage": "",
        "title": "Ecoponto",
        "rating": "5.0",
      },
      {
        "mainImage": "",
        "title": "Escova de Bambu",
        "valor": "10.0",
        "rating": "4.8",
      },
      {
        "mainImage": "",
        "title": "Passeio no parque",
        "rating": "4.96",
      },
    ];

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
                              cursorColor: Colors.white70,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.go,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  hintText: "Pesquisar..."),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.white70,
                              size: 27,
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
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: Text('Experiências'),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Container(
                    width: 60,
                    height: 50,
                    color: Colors.green,
                  ),
                  title: Text(
                    lista[index]['title'],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          lista[index]['rating'],
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        //Icons.star,
                        CupertinoIcons.star_fill,
                        color: Color(0xFFF6C209),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
