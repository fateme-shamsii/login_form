import 'package:application/forgetPass.dart';
import 'package:application/signUp.dart';
import 'package:application/widget/formLoginWidget.dart';
import 'package:flutter/material.dart';
import 'package:application/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: meduimp,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child:  Container(
          child: Column(children: [
            Container(
              alignment: Alignment.center,
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: meduimp,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: const Text("   Welcome \n   Back",
                  style: TextStyle(fontSize: 35, color: Colors.white)),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 60, bottom: 60.0, right: 60, top: 80),
              child:  FormLoginWidget(),
            ),
            TextButton(
                child: Text("Forget Password",
                    style: TextStyle(
                      color: meduimp1,
                      decoration: TextDecoration.underline,
                    )),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgetPass()));
                }),
            TextButton(
              child: Text("don't have acount? Sign Up ",
                  style: TextStyle(
                      color: meduimp1, decoration: TextDecoration.underline)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
            )
          ]),
        ),
      ),
    );
  }
}
