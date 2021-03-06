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
  Future<Highlights> highlights;

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
      future: ApiService.loadDashboardInfo(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasData) {
          final info = snapshot.data;
          print(info);
        }

        return Scaffold(
          body: Column(
            children: [
              DashboardMainItem(
                image:
                    "https://www.sema.ce.gov.br/wp-content/uploads/sites/36/2019/05/WhatsApp-Image-2019-05-24-at-16.35.42.jpeg",
                name: "Parque do Cocó",
                rating: "5.0",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardHomeItem(
                      image:
                          "https://www.tapisrouge.com.br/wp-content/uploads/2018/07/Parque-Estadual-do-Coc%C3%B3-22-696x465.jpg",
                      name: "Local em segundo lugar",
                      rating: "4.7",
                    ),
                    DashboardHomeItem(
                      image:
                          "https://diariodonordeste.verdesmares.com.br/image/contentid/policy:1.1858894:1590316748/image/image.jpg",
                      name: "Local em teceiro lugar",
                      rating: "4.5",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'Aquele ponto de coleta perfeito!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardHomeItem(
                      image:
                          "https://www.fortaleza.ce.gov.br/images/AscomSeuma/13.10.2017_Escola-Pev-3.jpg",
                      name: "Melhor local de coleta",
                      rating: "4.9",
                    ),
                    DashboardHomeItem(
                      image:
                          "https://veja.abril.com.br/wp-content/uploads/2016/06/ponto-de-coleta-seletiva-em-supermercado-no-rio-de-janeiro-original.jpeg",
                      name: "Segundo local de coleta",
                      rating: "4.7",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardHomeItem(
                      image:
                          "https://images.pexels.com/photos/4503265/pexels-photo-4503265.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                      name: "Terceiro local de coleta",
                      rating: "4.3",
                    ),
                    DashboardHomeItem(
                      image:
                          "https://images.pexels.com/photos/4503265/pexels-photo-4503265.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                      name: "Quadragésimo quinto local de coleta",
                      rating: "3.9",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
