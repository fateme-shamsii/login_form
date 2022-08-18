import 'package:application/border.dart';
import 'package:flutter/material.dart';
import 'package:application/constants.dart';
import 'package:email_validator/email_validator.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final TextEditingController _email1 = TextEditingController();
  final _fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: meduimp,
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: meduimp,
        elevation: 0.0,
      ),
      body: _build(),
    );
  }

  Widget _build() {
    return Form(
      key: _fromkey,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 300.0, left: 35.0),
          child: Column(children: <Widget>[
            SizedBox(
              width: 300.0,
              child: TextFormField(
                  controller: _email1,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email,
                        color: Color.fromARGB(255, 244, 218, 249)),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                    contentPadding: const EdgeInsets.only(left: 10.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    } else if (!EmailValidator.validate(value)) {
                      return 'Please correct the email';
                    }
                    return null;
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30.0),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(186, 104, 200, 1),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Result'),
                    content: const Text('A link has been sent to your email '),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('Go Back'))
                    ],
                  ),
                );
              },
              child: const Icon(
                Icons.check_circle_outline_sharp,
                color: Colors.white,
                size: 60.0,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
