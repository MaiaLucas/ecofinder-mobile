import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardHomeItem extends StatelessWidget {
  final dynamic image;
  final String name;
  final String rating;

  const DashboardHomeItem({
    Key key,
    @required this.image,
    @required this.name,
    @required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 70,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4,
                offset: Offset(2, 1),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              this.image?.isEmpty ?? true
                  ? Constants.NO_IMAGE
                  : this.image['images'][0]['path'],
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.27,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 5),
                  child: Text(
                    this.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 3),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.star_fill,
                      color: Color(0xFFF6C209),
                      size: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, top: 2),
                      child: Text(
                        this.rating,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
