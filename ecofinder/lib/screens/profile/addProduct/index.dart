import 'package:ecofinder/providers/product.dart';
import 'package:ecofinder/screens/profile/addProduct/product_step1.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    final deviceSize = MediaQuery.of(context).size;

    List<Widget> steps = [
      ProductStep1(),
    ];

    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastrar novo produto"),
        backgroundColor: Constants.TOPBOTTOM,
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.amberAccent,
          padding: EdgeInsets.only(top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 0.2,
                    image: AssetImage('assets/ecobag.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: deviceSize.height * 0.015),
              steps[productProvider.currentStep],
            ],
          ),
        ),
      ),
    );
  }
}
