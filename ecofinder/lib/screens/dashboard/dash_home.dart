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
                          "https://lh3.googleusercontent.com/proxy/O5imHvjxzGtMmG_hNpwQN3Y2jE3BCrmGAnknYrypSsER2DDULh0FiOF3RXVBYua35k4OPIO2ONhQnia2eBhcONxbPHzzZP9TzJ8cEAld1dWc9yuamFQvr8xpmKZ51y4RCByZJWDE3uTorOPYcI5yNukea5CkHoGjRhWdjws6fHw9Lu6ERwDktVhT5ybVrJALwhCGiGk4jIYD2Px6ke953wTEbRPP2dle",
                      name: "Terceiro local de coleta",
                      rating: "4.3",
                    ),
                    DashboardHomeItem(
                      image:
                          "https://lh3.googleusercontent.com/proxy/_EXf3GIqmucSsLbLkc2K-c6ISqwaTkTKg0Oh4GClqn71zWRdVmg3jDtcitkXWeQaEEnLrDGqeI8MTIbTvhx5erXCpd1Rfv6ITQ8zpC49Np0W0NpjUZwHt-_mIoz0VjkK-V0rJJYSxyI5MMg",
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
