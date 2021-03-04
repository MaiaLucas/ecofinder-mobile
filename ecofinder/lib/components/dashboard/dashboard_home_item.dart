import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardHomeItem extends StatelessWidget {
  const DashboardHomeItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 70,
          color: Colors.red,
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
                    'Nome do local número 1',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
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
                        '4.6',
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
