import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMainItem extends StatelessWidget {
  const DashboardMainItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.network(
            "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 15,
          child: Text(
            'Nome do local',
            style: TextStyle(
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
                  '5.0',
                  style: TextStyle(
                    fontSize: 20,
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
