import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  const SignButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Novo aqui? Crie sua conta!',
      style: TextStyle(color: Colors.white, fontSize: 12),
    );
  }
}
