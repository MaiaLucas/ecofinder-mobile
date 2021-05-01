import 'package:ecofinder/providers/place.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Buttons extends StatefulWidget {
  bool hasBackButton;
  final isValid;
  final stepContent;
  Buttons(
      {this.hasBackButton = true,
      this.isValid = false,
      this.stepContent,
      Key key})
      : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    PlaceProvider placeProvider = Provider.of(context);
    final deviceSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.hasBackButton
            ? Container(
                width: deviceSize.width * 0.3,
                height: deviceSize.height * 0.05,
                child: OutlinedButton(
                  child: Text('Voltar', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    placeProvider.step = placeProvider.currentStep - 1;
                  },
                ),
              )
            : SizedBox(),
        Container(
          width: deviceSize.width * 0.3,
          height: deviceSize.height * 0.05,
          child: ElevatedButton(
            child: Text('Avançar', style: TextStyle(fontSize: 20)),
            onPressed: () {
              if (widget.isValid()) {
                final content = widget.stepContent();

                placeProvider.createPlace = {
                  ...placeProvider.createPlaceContent,
                  ...content,
                };
                if (placeProvider.currentStep < 2)
                  placeProvider.step = placeProvider.currentStep + 1;
                else {
                  if (content['images'] != null)
                    placeProvider.image = content['images'];
                  placeProvider.create(context);
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
