import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMainItem extends StatelessWidget {
  final String image;
  final String name;
  final String rating;

  const DashboardMainItem({
    @required this.image,
    @required this.name,
    @required this.rating,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.network(
            this.image.length > 1 ? this.image : Constants.NO_IMAGE,
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 15,
          child: Text(
            this.name,
            style: TextStyle(
              shadows: [
                Shadow(
                  color: Colors.black87,
                  offset: Offset(3, 2),
                  blurRadius: 0,
                ),
              ],
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 15,
          child: Row(
            children: [
              Icon(
                //Icons.star,
                CupertinoIcons.star_fill,
                color: Color(0xFFF6C209),
                size: 21,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, top: 2),
                child: Text(
                  this.rating,
                  style: TextStyle(
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black87,
                        offset: Offset(3, 2),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
