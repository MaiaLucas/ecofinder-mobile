import 'package:ecofinder/models/User.dart';
import 'package:ecofinder/providers/auth.dart';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of(context);
    User user = auth.user;

    final deviceSize = MediaQuery.of(context).size;

    List<Map<String, dynamic>> options = [
      {
        'name': user.name,
        'subtitle': 'Editar Perfil',
        'action': () => {Navigator.pushNamed(context, Routes.PROFILEDETAIL)},
        'alignment': TextAlign.start,
        'icon': CircleAvatar(
          radius: 30,
          child: Text(user.name[0]),
          foregroundColor: Colors.white54,
          backgroundColor: Color(0xff38b000),
        ),
        'isDense': false,
      },
      {
        'name': 'Cadastrar Local',
        //'action': () => {print('Cadastrar Local')},
        'action': () => {Navigator.pushNamed(context, Routes.PLACESTEP1)},
        'isDense': true,
        'icon': Icon(CupertinoIcons.placemark_fill, size: 30),
      },
      {
        'name': 'Cadastrar Produto',
        'action': () => {Navigator.pushNamed(context, Routes.PRODUCTSTEP1)},
        'isDense': true,
        'icon': Icon(CupertinoIcons.bag_fill, size: 30),
      },
      {
        'name': 'Sair',
        'isDense': true,
        'icon': Icon(MdiIcons.fromString('location-exit'), size: 30),
        'action': () {
          Provider.of<AuthProvider>(context, listen: false).logout();
          Navigator.pushNamed(context, Routes.HOME);
        },
      },
    ];

    Widget optionsList = ListView.builder(
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        return Container(
          height: deviceSize.height * (option['isDense'] ? 0.1 : 0.15),
          alignment: Alignment.center,
          child: ListTile(
            leading: option['icon'] != null ? option['icon'] : null,
            onTap: option['action'],
            subtitle: option['subtitle'] != null
                ? Text(
                    option['subtitle'],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                : Text(""),
            title: Text(
              option['name'],
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );

    return Container(
      child: optionsList,
    );
  }
}
