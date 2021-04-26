import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ecofinder/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

class PlaceStep2 extends StatefulWidget {
  @override
  _PlaceStep2State createState() => _PlaceStep2State();
}

class _PlaceStep2State extends State<PlaceStep2> {
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
        title: Text("Cadastrar novo local 2/2"),
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
                            height: screenHeight * 0.2,
                            child: Center(
                              child:
                                  Text("Clique aqui para inserir uma imagem!"),
                            ),
                          ),
                  ),
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
              TextField(
                decoration: InputDecoration(
                  labelText: 'Abre às:',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Fecha às:',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              CheckboxListTile(
                title: Text(
                    "Marque apenas caso o local funcione nos fins de semana!"),
                value: isOpen,
                onChanged: (newValue) {
                  setState(() {
                    isOpen = newValue;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.trailing, //  <-- leading Checkbox
              ),
              SizedBox(height: 40),
              Container(
                width: screenWidth * 0.5,
                height: screenHeight * 0.05,
                child: ElevatedButton(
                  child: Text('Enviar!', style: TextStyle(fontSize: 20)),
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
