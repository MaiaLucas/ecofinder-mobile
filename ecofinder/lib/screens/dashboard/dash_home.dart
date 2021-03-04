import 'package:ecofinder/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/dashboard/dashboard_home_item.dart';
import '../../components/dashboard/dashboard_main_item.dart';

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
              DashboardMainItem(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardHomeItem(),
                    DashboardHomeItem(),
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
                    DashboardHomeItem(),
                    DashboardHomeItem(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardHomeItem(),
                    DashboardHomeItem(),
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
