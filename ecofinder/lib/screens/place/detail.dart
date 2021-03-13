import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecofinder/components/templates/card.dart';
import 'package:ecofinder/models/Place.dart';
import 'package:ecofinder/services/api.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetail extends StatefulWidget {
  @override
  _PlaceDetailState createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  _getCurrentLocation(String url) {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      launchURL(url, position);
    }).catchError((e) {
      print(e);
    });
  }

  launchURL(String url, Position location) async {
    final String mapsURL =
        "https://www.google.com/maps/dir/${location.latitude},${location.longitude}/$url";
    if (await canLaunch(mapsURL)) {
      await launch(mapsURL);
    } else {
      throw 'Could not launch $mapsURL';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> arguments =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    return FutureBuilder(
      future: ApiService.placeDetail(arguments['id']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final Place data = snapshot.data;
          final List<dynamic> imagesList =
              data.imagesUrl['images']?.isEmpty ?? true
                  ? [
                      {"path": Constants.NO_IMAGE}
                    ]
                  : data.imagesUrl['images'];

          final List<Widget> images = imagesList
              .map(
                (item) => Container(
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                            item['path'],
                            fit: BoxFit.cover,
                            width: 1000.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList();
          return Scaffold(
            backgroundColor: Constants.BACKGROUND,
            appBar: AppBar(
              title: Text(data.title),
              backgroundColor: Constants.TOPBOTTOM,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Stack(
                  children: [
                    //INFORMAÇÕES
                    Column(
                      children: [
                        CarouselSlider(
                          items: images,
                          options: CarouselOptions(
                            autoPlay: false,
                            enableInfiniteScroll: false,
                            height: MediaQuery.of(context).size.height * 0.3,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 15, right: 15),
                          // color: Colors.amberAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CardInfo(
                                color: Color(0xFF34623f),
                                info: data.description,
                                size: 1,
                                height: 0.15,
                                title: 'Descrição',
                              ),
                              // SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CardInfo(
                                    color: Color(0xFF73a942),
                                    info: data.phone,
                                    size: 0.35,
                                    title: 'Telefone',
                                  ),
                                  CardInfo(
                                    color: Color(0xFF3da35d),
                                    size: 0.55,
                                    info:
                                        "${data.openOnWeekend ? 'Todos os dias' : 'De Seg a Sex'} \n das ${data.hrInit} às ${data.hrFinal}",
                                    title: 'Funcionamento',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // BOTÃO DE VOLTAR
                    // Positioned(
                    //   top: 15.0,
                    //   left: 10.0,
                    //   child: IconButton(
                    //     icon: Icon(Icons.arrow_back_ios_rounded),
                    //     color: Color(0xFF38b000),
                    //     iconSize: 30,
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //   ),
                    // ),
                    // BOTÃO PARA ABRIR O MAPA
                    Positioned(
                      bottom: 20.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 10,
                              offset: Offset(4, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.map_rounded),
                          onPressed: () => {
                            // "${data.address.replaceAll(' ', '+')},+${data.city.replaceAll(' ', '+')}"
                            _getCurrentLocation(
                                'R.+Monsenhor+Bruno,+1153,+Fortaleza')
                          },
                          // color: Colors.black38,
                          label: Text(
                            "MOSTRAR MAPA",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
