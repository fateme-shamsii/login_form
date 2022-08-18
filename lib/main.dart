import 'package:application/constants.dart';
import 'package:application/signUp.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form App',
      theme: ThemeData(
        primaryColor: meduimp,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SignUp(),
    );
  }
}
