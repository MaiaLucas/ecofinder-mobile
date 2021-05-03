import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecofinder/components/templates/card.dart';
import 'package:ecofinder/models/Product.dart';
import 'package:ecofinder/services/api.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:ecofinder/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> arguments =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;

    final deviceSize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;

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

        final Widget bottomImageInfo = Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black26,
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'R\$ ${product.price.toString()}',
                  style: TextStyle(
                    fontSize: 34,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.star_fill,
                      color: Color(0xFFF6C209),
                      size: 21,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      product.rating.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

        return Scaffold(
            backgroundColor: Constants.BACKGROUND,
            appBar: AppBar(
              title: Text(product.title),
              backgroundColor: Constants.TOPBOTTOM,
              centerTitle: true,
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    CarouselSlider(
                      items: Helpers.getImages(
                        list: product.imagesUrl['images'],
                        showBottomInfo: true,
                        bottomInfo: bottomImageInfo,
                      ),
                      options: CarouselOptions(
                        autoPlay: false,
                        enableInfiniteScroll: false,
                        height: deviceSize.height * 0.4,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                      ),
                    ),
                    Container(
                      height: deviceSize.height * 0.4,
                      width: deviceSize.width,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          product.description != null
                              ? CardInfo(
                                  color: Color(0xFF34632f),
                                  info: product.description ?? "",
                                  size: 1,
                                  height: 0.15,
                                  title: 'Descrição',
                                  icon: Icon(Icons.info_outline),
                                )
                              : SizedBox(
                                  width: 0,
                                ),
                          Center(
                            child: product.instagramAccount != null &&
                                    product.instagramAccount.isNotEmpty
                                ? Container(
                                    width: screenWidth * 0.5,
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.lightGreen[900],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    child: TextButton.icon(
                                      label: Text(
                                        "Instagram",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      icon: Icon(
                                        MdiIcons.fromString('instagram'),
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        // launchURL(product.instagramAccount)
                                        final account = (product
                                            .instagramAccount
                                            .replaceAll('@', ''));
                                        launchURL(
                                            'https://www.instagram.com/$account/');
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    width: 0,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
