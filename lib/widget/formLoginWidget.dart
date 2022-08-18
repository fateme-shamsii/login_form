import 'package:application/border.dart';
import 'package:application/constants.dart';
import 'package:application/successful.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';


class FormLoginWidget extends StatefulWidget {

  const FormLoginWidget({Key? key}) : super(key: key);
  @override
  State<FormLoginWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  bool _passwordVisible = false, _rememberMe = true;

  final _fromkey = GlobalKey<FormState>();
  @override
  void initState() {
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromkey,
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        SizedBox(
          width: 300.0,
          child: TextFormField(
            controller: _email,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email,
                  color: Color.fromARGB(255, 192, 136, 202)),
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding: const EdgeInsets.only(left: 10.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter email';
              } else if (!EmailValidator.validate(value)) {
                return 'Please correct the email';
              }
              return null;
            },
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 30.0)),
        SizedBox(
          width: 300.0,
          child: TextFormField(
            controller: _pass,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock,
                  color: Color.fromARGB(255, 192, 136, 202)),
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding: const EdgeInsets.only(left: 10.0),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromARGB(255, 192, 136, 202),
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Password';
              }else if (value.length < 8) {
                return "password must be more than 8 characters";
              }
              return null;
            },
          ),
        ),
        _renderRememberMe(),
        const Padding(padding: EdgeInsets.only(top: 30.0)),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: white,
          ),
          onPressed: () {
            if (_fromkey.currentState!.validate()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Successful()));
            }
          },
          child: const Icon(
            Icons.arrow_circle_right_rounded,
            color: Color.fromRGBO(186, 104, 200, 1),
            size: 60.0,
          ),
        ),
      ]),
    );
  }

  Widget _renderRememberMe() {
    return Row(children: <Widget>[
      GestureDetector(
        onTap: () => _pressRememberMe(!_rememberMe),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  value: _rememberMe,
                  onChanged: _pressRememberMe,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: const Text("Remember Me"),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  void _pressRememberMe(val) {
    setState(() {
      _rememberMe = val;
    });
  }
}
