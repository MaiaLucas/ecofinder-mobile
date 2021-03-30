import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecofinder/models/Highlights.dart';
import 'package:ecofinder/services/api.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/dashboard/dashboard_home_item.dart';
import '../../components/dashboard/dashboard_main_item.dart';

class DashHome extends StatefulWidget {
  @override
  _DashHomeState createState() => _DashHomeState();
}

class _DashHomeState extends State<DashHome> {
  Future<Highlights> highlights;

  @override
  void initState() {
    super.initState();
    highlights = ApiService.loadDashboardInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //Responsável por retornar uma lista de Widgets
  //@params list lista com os elementos a serem exibidos

  List<Widget> _getListWidget(List<dynamic> list) {
    return list
        .map(
          (e) => DashboardHomeItem(
            id: e['id'],
            image: e['imagesUrl'],
            name: e['title'],
            rating: e['rating'].toString(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: highlights,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final info = snapshot.data;
          final List<dynamic> listHighlights = info.listHighlights;
          final List<dynamic> listExperiences = info.listExperiences;

          return Scaffold(
            backgroundColor: Constants.BACKGROUND,
            body: Stack(
              children: [
                Column(
                  children: [
                    // Destaque
                    DashboardMainItem(
                      id: info.highlight['id'],
                      image: info.highlight['imagesUrl'],
                      name: info.highlight['title'],
                      rating: info.highlight['rating'], //.toString(),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                        'Populares',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),

                    CarouselSlider(
                      items: _getListWidget(listHighlights),
                      options: CarouselOptions(
                        autoPlay: false,
                        enableInfiniteScroll: true,
                        height: MediaQuery.of(context).size.height * 0.18,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 10.0),
                      child: AutoSizeText(
                        'Aqui você encontra as melhores experiências',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),

                    CarouselSlider(
                      items: _getListWidget(listExperiences),
                      options: CarouselOptions(
                        autoPlay: false,
                        enableInfiniteScroll: true,
                        height: MediaQuery.of(context).size.height * 0.18,
                      ),
                    ),
                  ],
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

// marco 142 linhas
