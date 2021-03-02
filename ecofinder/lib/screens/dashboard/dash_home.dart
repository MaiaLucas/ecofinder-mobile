import 'package:ecofinder/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService.loadDashboardInfo(),
        builder: (context, snapshot) {
          final info = snapshot.data;
          print('info');
          print(info);
          return Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.network(
                        "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                        height: 355,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Text(
                        'Nome do local',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 15,
                      child: Row(
                        children: [
                          Text('4.6'),
                          Icon(
                            //Icons.star,
                            CupertinoIcons.star_fill,
                            color: Color(0xFFF6C209),
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 70,
                            color: Colors.red,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5, bottom: 10),
                                  child: Text(
                                    'Nome do local',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 70,
                            color: Colors.red,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, bottom: 10),
                                  child: Text(
                                    'Nome do local',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
