import 'package:disease_app/ui/resources/constants.dart';
import 'package:disease_app/ui/views/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
