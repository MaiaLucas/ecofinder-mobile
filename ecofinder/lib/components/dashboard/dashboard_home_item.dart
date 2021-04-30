import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardHomeItem extends StatelessWidget {
  final int id;
  final dynamic image;
  final String name;
  final dynamic rating;

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
    return ClipRRect(
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.PLACEDETAIL,
                  arguments: {'id': id});
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(preview),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                ),
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      name,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          (double.parse(rating)).toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Icon(
                            CupertinoIcons.star_fill,
                            size: 20,
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
