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
        title: Text("Cadastrar novo local 1/2"),
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
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Descrição",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Cidade',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Endereço completo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Número para contato',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: screenWidth * 0.5,
                height: screenHeight * 0.05,
                child: ElevatedButton(
                  child: Text('Próxima página', style: TextStyle(fontSize: 20)),
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
