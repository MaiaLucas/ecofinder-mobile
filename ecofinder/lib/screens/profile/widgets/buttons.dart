import 'package:ecofinder/providers/place.dart';
import 'package:ecofinder/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Buttons extends StatefulWidget {
  bool hasBackButton;
  final isValid;
  final stepContent;
  final provider;
  final isLastStep;
  Buttons(
      {this.hasBackButton = true,
      this.isValid = false,
      this.isLastStep = false,
      this.stepContent,
      this.provider,
      Key key})
      : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    void showLoadingIndicator() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Loading();
        },
      );
    }

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
                    widget.provider.step = widget.provider.currentStep - 1;
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
                widget.provider.object = content;
                if (!widget.isLastStep) {
                  widget.provider.step = widget.provider.currentStep + 1;
                } else {
                  showLoadingIndicator();
                  if (content['images'] != null && content['images'].isNotEmpty)
                    widget.provider.image = content['images'];

                  widget.provider.create(context);
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
