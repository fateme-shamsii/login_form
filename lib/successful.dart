import 'package:application/constants.dart';
import 'package:flutter/material.dart';

class Successful extends StatelessWidget {
  const Successful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: meduimp,
        elevation: 0.0,
      ),
      body: const Center(
        child: Text(
          "Welcome",
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
