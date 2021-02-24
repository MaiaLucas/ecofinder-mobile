import 'package:flutter/material.dart';

class DashHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Text(
                    'Nome do local',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 5,
                top: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    color: Colors.red,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, bottom: 10),
                          child: Text(
                            'Nome do local',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'A descrição do local ficará aqui, então vou escrever muito.',
                            overflow: TextOverflow.clip,
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
      ),
    );
  }
}
