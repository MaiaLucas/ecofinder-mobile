import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/widgets.dart';

class Helpers {
  static List<Widget> getImages(dynamic list) {
    print(list);
    final List<dynamic> imagesList = list?.isEmpty ?? true
        ? [
            {"path": Constants.NO_IMAGE}
          ]
        : list;

    return imagesList
        .map(
          (item) => Container(
            child: Container(
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
          ),
        )
        .toList();
  }
}
