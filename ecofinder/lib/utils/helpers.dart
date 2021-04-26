import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Helpers {
  static List<Widget> getImages({
    dynamic list,
    bool showBottomInfo = false,
    Widget bottomInfo,
  }) {
    print(list);
    final List<dynamic> imagesList = list?.isEmpty ?? true
        ? [
            {"path": Constants.NO_IMAGE}
          ]
        : list;

    return imagesList
        .map(
          (item) => Stack(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        item['path'],
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                    ],
                  ),
                ),
              ),
              showBottomInfo ? bottomInfo : null,
            ],
          ),
        )
        .toList();
  }
}
