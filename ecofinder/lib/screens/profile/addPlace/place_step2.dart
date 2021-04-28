import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';

class PlaceStep2 extends StatefulWidget {
  @override
  _PlaceStep2State createState() => _PlaceStep2State();
}

class _PlaceStep2State extends State<PlaceStep2> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      appBar: AppBar(
        title: Text("Cadastrar novo local"),
        backgroundColor: Constants.TOPBOTTOM,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/map2.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              DropdownButton<String>(
                dropdownColor: Constants.TOPBOTTOM,
                isExpanded: true,
                hint: Text('Tipo do local'),
                items: <String>['Experiência', 'Ponto de coleta']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              SizedBox(height: screenHeight * 0.015),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Cidade',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Endereço completo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.05,
                child: ElevatedButton(
                  child: Text('Avançar', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.PLACESTEP3);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
