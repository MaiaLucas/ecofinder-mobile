import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dash_home.dart';
import 'dash_search.dart';
import 'dash_store.dart';
import 'dash_menu.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _paginaAtual = 0;

  void aoMudarDeAba(int indice) {
    setState(() {
      _paginaAtual = indice;
    });
  }

  final List<Widget> _telas = [
    DashHome(),
    DashSearch(),
    DashStore(),
    DashMenu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Color(0xFF1e2f23),
        selectedItemColor: Color(0xFFaad576),
        unselectedItemColor: Colors.white24,
        iconSize: 27,
        currentIndex: _paginaAtual,
        onTap: aoMudarDeAba,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            label: "Home",
            activeIcon: Icon(CupertinoIcons.house_fill),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bag),
            label: "Store",
            activeIcon: Icon(CupertinoIcons.bag_fill),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "User",
            activeIcon: Icon(CupertinoIcons.person_fill),
          ),
        ],
      ),
    );
  }
}
