import 'dart:io';
import 'package:ecofinder/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

class PlaceStep3 extends StatefulWidget {
  @override
  _PlaceStep3State createState() => _PlaceStep3State();
}

class _PlaceStep3State extends State<PlaceStep3> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    File _image;
    bool isOpen = false;

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
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/map.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
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
                            decoration: BoxDecoration(color: Colors.white24),
                            width: screenWidth,
                            height: screenHeight * 0.23,
                            child: Center(
                              child: Text("Adicionar uma imagem"),
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Abre às:',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Fecha às:',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              CheckboxListTile(
                title: Text("Abre aos fins de semana?"),
                value: isOpen,
                onChanged: (newValue) {
                  setState(() {
                    isOpen = newValue;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.trailing, //  <-- leading Checkbox
              ),
              SizedBox(height: screenHeight * 0.035),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.05,
                child: ElevatedButton(
                  child: Text('Cadastrar', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.PLACESTEP4);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
