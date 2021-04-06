import 'package:ecofinder/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    List<Map<String, dynamic>> options = [
      {
        'name': 'Perfil',
        'action': () => {print('perfil')},
      },
      {
        'name': 'Cadastrar Local',
        'action': () => {print('Cadastrar Local')},
      },
      {
        'name': 'Cadastrar Produto',
        'action': () => {print('Cadastrar Produto')},
      },
      {
        'name': 'Sair',
        'action': () {
          Provider.of<AuthProvider>(context, listen: false).logout();
        },
      },
    ];
    return Container(
      child: Column(
        children: options
            .map(
              (option) => InkWell(
                onTap: option['action'],
                child: Container(
                  height: deviceSize.height * 0.10,
                  child: Center(
                    child: Text(option['name']),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
