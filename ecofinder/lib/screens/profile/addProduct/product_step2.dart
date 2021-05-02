import 'dart:io';

import 'package:ecofinder/providers/product.dart';
import 'package:ecofinder/screens/profile/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProductStep2 extends StatefulWidget {
  @override
  _ProductStep2State createState() => _ProductStep2State();
}

class _ProductStep2State extends State<ProductStep2> {
  final _formKey = GlobalKey<FormState>();

  PickedFile image;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  pickImage(ImageSource source, ProductProvider provider) async {
    final file = await _picker.getImage(
      source: source,
      imageQuality: 50,
    );

    setState(() {
      // _image = File(file.path);
      image = file;
    });
  }

  void _showPicker(context, ProductProvider provider) {
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
                      pickImage(ImageSource.gallery, provider);
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
    double screenHeight = MediaQuery.of(context).size.height;
    ProductProvider productProvider = Provider.of(context);
    final content = productProvider.createObject;

    TextEditingController _instagramController = TextEditingController(
      text: content['instagram_account'] != null
          ? content['instagram_account']
          : '',
    );
    TextEditingController _facebookController = TextEditingController(
      text: content['facebook_link'] != null ? content['facebook_link'] : '',
    );

    String _instaAccount, _facebookLink;

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context, productProvider);
                },
                child: Row(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    width: 70,
                    height: 70,
                    child: Center(
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                  ),
                  image != null
                      ? Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image.file(
                              File(image.path),
                              width: 70,
                              height: 70,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        )
                      : SizedBox(),
                ]),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            TextFormField(
              initialValue: _instagramController.text,
              onSaved: (val) {
                setState(() {
                  _instaAccount = val;
                });
              },
              decoration: InputDecoration(
                labelText: '@ no Instagram',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            TextFormField(
              initialValue: _facebookController.text,
              onSaved: (val) {
                setState(() {
                  _facebookLink = val;
                });
              },
              decoration: InputDecoration(
                labelText: 'Link para Facebook',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: screenHeight * 0.035),
            Buttons(
              provider: productProvider,
              isLastStep: true,
              isValid: () {
                return _formKey.currentState.validate();
              },
              stepContent: () {
                _formKey.currentState.save();
                Map<String, dynamic> stepContent = {
                  'facebook_link': _facebookLink,
                  'instagram_account': _instaAccount,
                  'images': image != null ? image.path : ''
                };

                return stepContent;
              },
            )
          ],
        ),
      ),
    );
  }
}
