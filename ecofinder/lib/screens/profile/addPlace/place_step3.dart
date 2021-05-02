import 'dart:io';

import 'package:ecofinder/providers/place.dart';
import 'package:ecofinder/screens/profile/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PlaceStep3 extends StatefulWidget {
  @override
  _PlaceStep3State createState() => _PlaceStep3State();
}

class _PlaceStep3State extends State<PlaceStep3> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay now = TimeOfDay.now();
  TimeOfDay hrInit = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay hrFinal = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _hrInitController = TextEditingController(),
      _hrFinalController = TextEditingController();

  String hrInitStr, hrFinalStr;
  PickedFile image;
  final _picker = ImagePicker();

  Future<Null> _selectTime({
    BuildContext context,
    TextEditingController controller,
    TimeOfDay timer,
    String text,
  }) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: timer,
    );

    if (picked != null) {
      setState(() {
        timer = picked;
        controller.text = timer.format(context);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  pickImage(ImageSource source, PlaceProvider provider) async {
    final file = await _picker.getImage(
      source: source,
      imageQuality: 50,
    );

    setState(() {
      // _image = File(file.path);
      image = file;
    });
  }

  void _showPicker(context, PlaceProvider provider) {
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
    PlaceProvider placeProvider = Provider.of(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context, placeProvider);
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _selectTime(
                            context: context,
                            timer: hrInit,
                            controller: _hrInitController,
                            text: hrInitStr,
                          );
                        },
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          controller: _hrInitController,
                          enabled: false,
                          onSaved: (value) {
                            hrInitStr = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Este campo é obrigatório';

                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Abre às:',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _selectTime(
                            context: context,
                            timer: hrFinal,
                            controller: _hrFinalController,
                            text: hrFinalStr,
                          );
                        },
                        child: TextFormField(
                          enabled: false,
                          controller: _hrFinalController,
                          keyboardType: TextInputType.datetime,
                          onSaved: (value) {
                            hrFinalStr = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Este campo é obrigatório';

                            if (hrInit.hour > hrFinal.hour)
                              return 'Defina um horário mais tarde';

                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Fecha às:',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Buttons(
                  provider: placeProvider,
                  isValid: () {
                    return _formKey.currentState.validate();
                  },
                  stepContent: () {
                    _formKey.currentState.save();
                    Map<String, dynamic> stepContent = {
                      'hr_init': hrInitStr,
                      'hr_final': hrFinalStr,
                      'images': image.path,
                      // 'open_on_weekend': isOpen,
                    };

                    return stepContent;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
