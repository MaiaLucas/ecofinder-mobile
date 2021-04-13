import 'package:ecofinder/models/User.dart';
import 'package:ecofinder/providers/auth.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfileDetail extends StatefulWidget {
  ProfileDetail({Key key}) : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of(context);
    User user = auth.user;
    Map<String, TextEditingController> _controllers = {
      'email': TextEditingController(text: user.email),
      'full_name': TextEditingController(text: user.name),
    };

    onSubmit() {
      print('submit');
    }

    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      appBar: AppBar(
        backgroundColor: Constants.BACKGROUND,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Perfil'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Color(0xFF008000),
            ),
            onPressed: () {
              onSubmit();
              // Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Imagem
            Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFccff33)),
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: NetworkImage(user.avatar),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 100,
                    width: 100,
                  ),
                  Text('Trocar Imagem'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  readOnly: true,
                  enabled: false,
                  controller: _controllers['email'],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _controllers['full_name'],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome Completo',
                  ),
                )
              ],
            )
            //Inputs
          ],
        ),
      ),
    );
  }
}
