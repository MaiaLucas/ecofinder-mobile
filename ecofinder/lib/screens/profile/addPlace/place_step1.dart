import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

class PlaceStep1 extends StatefulWidget {
  @override
  _PlaceStep1State createState() => _PlaceStep1State();
}

class _PlaceStep1State extends State<PlaceStep1> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    File _image;

    _imgFromCamera() async {
      File image = await ImagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 50);

      setState(() {
        _image = image;
      });
    }

    _imgFromGallery() async {
      File image = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);

      setState(() {
        _image = image;
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
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                    ListTile(
                      leading: Icon(Icons.photo_camera),
                      title: Text('Camera'),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Constants.BACKGROUND,
      appBar: AppBar(
        title: Text("Cadastrar novo local"),
        backgroundColor: Constants.TOPBOTTOM,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Localização',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              DropdownButton<String>(
                dropdownColor: Constants.TOPBOTTOM,
                isExpanded: true,
                hint: Text('Tipo do local'),
                items: <String>['Experiência', 'Ponto de coleta']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              SizedBox(height: 15),
              Container(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: Container(
                    child: _image != null
                        ? Container(
                            child: ClipRRect(
                              child: Image.file(
                                _image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        : Container(
                            decoration:
                                BoxDecoration(color: Constants.TOPBOTTOM),
                            width: screenWidth,
                            height: screenHeight * 0.2,
                            child: Text("Clique aqui para inserir uma imagem"),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(height: 15),
              Container(
                width: screenWidth * 0.5,
                height: screenHeight * 0.05,
                child: ElevatedButton(
                  child: Text('Próxima página', style: TextStyle(fontSize: 20)),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
