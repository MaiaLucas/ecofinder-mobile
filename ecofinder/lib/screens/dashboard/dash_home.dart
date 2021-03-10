import 'package:ecofinder/models/Highlights.dart';
import 'package:ecofinder/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/dashboard/dashboard_home_item.dart';
import '../../components/dashboard/dashboard_main_item.dart';

class DashHome extends StatefulWidget {
  @override
  _DashHomeState createState() => _DashHomeState();
}

class _DashHomeState extends State<DashHome> {
  Future<dynamic> highlights;

  @override
  void initState() {
    super.initState();
    print('init state');
    highlights = ApiService.loadDashboardInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: highlights,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final dashboardInfo = snapshot.data;
          final Map<String, dynamic> highlight = dashboardInfo['highlight'];
          final List<dynamic> top2 = dashboardInfo['top2'];
          final List<dynamic> experience = dashboardInfo['experience'];
          return Scaffold(
            body: Column(
              children: [
                // Destaque
                DashboardMainItem(
                  image: highlight['imagesUrl'],
                  name: highlight['title'],
                  rating: highlight['rating'].toString(),
                ),

                // Top 2
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DashboardHomeItem(
                        id: top2[0]['id'],
                        image: top2[0]['imagesUrl'],
                        name: top2[0]['title'],
                        rating: top2[0]['rating'].toString(),
                      ),
                      DashboardHomeItem(
                        id: top2[1]['id'],
                        image: top2[1]['imagesUrl'],
                        name: top2[1]['title'],
                        rating: top2[1]['rating'].toString(),
                      ),
                    ],
                  ),
                ),

                //Titulo
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Venha ter muitas experiências!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),

                // Destaques lista de experiencias
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DashboardHomeItem(
                        id: experience[0]['id'],
                        image: experience[0]['imagesUrl'],
                        name: experience[0]['title'],
                        rating: experience[0]['rating'].toString(),
                      ),
                      DashboardHomeItem(
                        id: experience[1]['id'],
                        image: experience[1]['imagesUrl'],
                        name: experience[1]['title'],
                        rating: experience[1]['rating'].toString(),
                      ),
                    ],
                  ),
                ),

                // Destaques lista de experiencias
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DashboardHomeItem(
                        id: experience[0]['id'],
                        image: experience[0]['imagesUrl'],
                        name: experience[0]['title'],
                        rating: experience[0]['rating'].toString(),
                      ),
                      DashboardHomeItem(
                        id: experience[1]['id'],
                        image: experience[1]['imagesUrl'],
                        name: experience[1]['title'],
                        rating: experience[1]['rating'].toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Color(0xFFC5C5C5),
          ));
        }
      },
    );
  }
}
