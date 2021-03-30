import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecofinder/models/Product.dart';
import 'package:ecofinder/services/api.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:ecofinder/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> arguments =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    return FutureBuilder(
      future: ApiService.productDetail(arguments['id']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final Product product = snapshot.data;

        return Scaffold(
            backgroundColor: Constants.BACKGROUND,
            appBar: AppBar(
              title: Text(product.title),
              backgroundColor: Constants.TOPBOTTOM,
              centerTitle: true,
            ),
            body: Stack(
              children: [
                CarouselSlider(
                  items: Helpers.getImages(product.imagesUrl['images']),
                  options: CarouselOptions(
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    height: MediaQuery.of(context).size.height * 0.4,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                  ),
                )
              ],
            ));
      },
    );
  }
}
