import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';

class PlaceStep1 extends StatefulWidget {
  @override
  _PlaceStep1State createState() => _PlaceStep1State();
}

class _PlaceStep1State extends State<PlaceStep1> {
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
                    image: AssetImage('assets/map1.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Container(
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Descrição",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Número para contato',
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
                    Navigator.pushNamed(context, Routes.PLACESTEP2);
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