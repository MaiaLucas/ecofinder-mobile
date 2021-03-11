import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardHomeItem extends StatelessWidget {
  final int id;
  final dynamic image;
  final String name;
  final String rating;

  const DashboardHomeItem({
    Key key,
    @required this.id,
    @required this.image,
    @required this.name,
    @required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preview = this.image?.isEmpty ?? true
        ? Constants.NO_IMAGE
        : this.image['images'][0]['path'];
    return Stack(
      // alignment: Alignment.topLeft,
      children: [
        InkWell(
          onTap: () {
            // Navigator.pushNamed(context, Routes.PLACEDETAIL, arguments: {'id': id});
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              image: DecorationImage(
                image: NetworkImage(preview),
                fit: BoxFit.cover,
                scale: 0.5,
              ),
            ),
            child: Text(name),
          ),
        ),
      ],
    );
  }
}
