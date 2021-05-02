import 'package:ecofinder/app.dart';
import 'package:ecofinder/providers/auth.dart';
import 'package:ecofinder/providers/place.dart';
import 'package:ecofinder/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new AuthProvider()),
        ChangeNotifierProvider(create: (_) => new PlaceProvider()),
        ChangeNotifierProvider(create: (_) => new ProductProvider()),
      ],
      child: App(),
    );
  }
}
