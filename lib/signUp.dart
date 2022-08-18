import 'package:application/loginPage.dart';
import 'package:application/widget/fromSignUpwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:application/constants.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: meduimp,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: meduimp,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(30)),
                  ),
                  child: const Text("   Create \n   Acount",
                      style: TextStyle(fontSize: 35, color: Colors.white)),
                ),
                Container(
                  padding: const EdgeInsets.all(60.0),
                  child: const FromSignUpWidget(),
                ),
                TextButton(
                  child: Text("do you have acount? Sign in ",
                      style: TextStyle(
                          color: meduimp1,
                          decoration: TextDecoration.underline)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                )
              ]),
        ),
      ),
    );
  }
}
