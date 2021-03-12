import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMainItem extends StatelessWidget {
  final dynamic image;
  final int id;
  final String name;
  final dynamic rating;

  const DashboardMainItem({
    @required this.image,
    @required this.id,
    @required this.name,
    @required this.rating,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final highlight = this.image['images'].length > 0
        ? this.image['images'][0]['path']
        : Constants.NO_IMAGE;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.PLACEDETAIL, arguments: {'id': id});
      },
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height * 0.42,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              image: DecorationImage(
                image: NetworkImage(highlight),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        name,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            //Icons.star,
                            CupertinoIcons.star_fill,
                            color: Color(0xFFF6C209),
                            size: 21,
                          ),
                          Text(
                            (rating.toDouble()).toString(),
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
