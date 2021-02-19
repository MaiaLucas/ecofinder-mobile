import 'package:flutter/material.dart';

class DashHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            snap: true,
            actionsIconTheme: IconThemeData(opacity: 0.0),
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
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
