import 'dart:io';

import 'package:ecofinder/models/User.dart';
import 'package:ecofinder/providers/auth.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileDetail extends StatefulWidget {
  ProfileDetail({Key key}) : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final _formKey = GlobalKey<FormState>();
  PickedFile image;
  final _picker = ImagePicker();

  pickImage(ImageSource source) async {
    final file = await _picker.getImage(
      source: source,
      imageQuality: 50,
    );

    setState(() {
      // _image = File(file.path);
      image = file;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Photo Library'),
                    onTap: () {
                      pickImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of(context);
    User user = auth.user;
    //final deviceSize = MediaQuery.of(context).size;
    final avatar = user.avatar != null && user.avatar.isNotEmpty
        ? NetworkImage(user.avatar)
        : AssetImage('assets/tree.png');
    Map<String, TextEditingController> _controllers = {
      'email': TextEditingController(text: user.email),
      'full_name': TextEditingController(text: user.name),
    };

    String _fullName;
    onSubmit() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        auth.image = image != null ? image.path : '';
        Map<String, dynamic> data = {
          'email': user.email,
          'full_name': _fullName,
        };

        auth.data = data;

        auth.editUser(context);
      }
    }

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
            InkWell(
              onTap: () {
                _showPicker(context);
              },
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          image != null ? FileImage(File(image.path)) : avatar,
                    ),
                    Positioned(
                      top: 55,
                      right: 55,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
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
                  TextFormField(
                    initialValue: _controllers['full_name'].text,
                    onSaved: (String val) {
                      setState(() {
                        _fullName = val;
                      });
                    },
                    validator: (String val) {
                      if (val == null || val.isEmpty)
                        return 'Este campo é obrigatório';

                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome Completo',
                    ),
                  )
                ],
              ),
            )
            //Inputs
          ],
        ),
      ),
    );
  }
}
