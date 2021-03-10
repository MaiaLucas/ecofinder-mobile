import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CardInfo extends StatelessWidget {
  final String info;
  final String title;
  final double size;
  final double height;
  final Color color;
  const CardInfo({
    Key key,
    this.info,
    this.title,
    this.color,
    this.size,
    this.height = 0.1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * size,
      height: MediaQuery.of(context).size.height * height,
      padding: EdgeInsets.all(15.0),
      // color: color,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(4, 3),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            maxLines: 1,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            info,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
