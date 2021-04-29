import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';

class ProductStep3 extends StatefulWidget {
  @override
  _ProductStep3State createState() => _ProductStep3State();
}

class _ProductStep3State extends State<ProductStep3> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      appBar: AppBar(
        title: Text("Cadastrar novo produto"),
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
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/like.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Text(
                "Solicitação de cadastro de produto enviada com sucesso.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              Container(
                width: screenWidth * 0.17,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  child: Text('OK', style: TextStyle(fontSize: 25)),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
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
