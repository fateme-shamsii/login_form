import 'package:application/border.dart';
import 'package:application/constants.dart';
import 'package:application/loginPage.dart';
import 'package:application/successful.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class FromSignUpWidget extends StatefulWidget {
  const FromSignUpWidget({Key? key}) : super(key: key);

  @override
  State<FromSignUpWidget> createState() => _FromSignUpWidgetState();
}

class _FromSignUpWidgetState extends State<FromSignUpWidget> {
  final _fromkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _passConform = TextEditingController();
  final TextEditingController _anwer = TextEditingController();
    final TextEditingController _anwer1 = TextEditingController();


  bool isVisible = false;
  bool isVisible1 = false;

  final List<String> items = [
    'where is your favorite color?',
    'What is your favortie season?',
    'what is your favorite name?',
    'what is your favorite country',
  ];
  String? selectedValue;
  String? selectedValue1;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromkey,
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        SizedBox(
          width: 300.0,
          child: TextFormField(
            maxLength: 20,
            decoration: InputDecoration(
              labelText: "Name ",
              prefixIcon: const Icon(Icons.account_circle,
                  color: Color.fromARGB(255, 192, 136, 202)),
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding: const EdgeInsets.only(left: 10.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return " enter your name";
              }
              return null;
            },
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 30.0)),
        SizedBox(
          width: 300.0,
          child: TextFormField(
            maxLength: 3,
            decoration: InputDecoration(
              labelText: "Age",
              prefixIcon: const Icon(Icons.date_range,
                  color: Color.fromARGB(255, 192, 136, 202)),
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding: const EdgeInsets.only(left: 10.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "  enter your age";
              }
              return null;
            },
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 18.0)),
        SizedBox(
          width: 300.0,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Country",
              prefixIcon: const Icon(Icons.location_city,
                  color: Color.fromARGB(255, 192, 136, 202)),
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding: const EdgeInsets.only(left: 10.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "enter your country";
              }
              return null;
            },
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 30.0)),
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
            obscureText: true,
            controller: _pass,
            decoration: InputDecoration(
              labelText: "Pasword",
              prefixIcon: const Icon(Icons.lock_outlined,
                  color: Color.fromARGB(255, 192, 136, 202)),
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding: const EdgeInsets.only(left: 10.0),
              suffixIcon: const Icon(
                Icons.visibility_off,
                color: Color.fromARGB(255, 192, 136, 202),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "enter your password";
              } else if (value.length < 8) {
                return "password must be more than 8 characters";
              }
              return null;
            },
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 30.0)),
        SizedBox(
          width: 300.0,
          child: TextFormField(
            obscureText: true,
            controller: _passConform,
            decoration: InputDecoration(
              labelText: "Password Conform",
              prefixIcon: const Icon(Icons.lock_outlined,
                  color: Color.fromARGB(255, 192, 136, 202)),
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              contentPadding: const EdgeInsets.only(left: 10.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "enter your password";
              } else if (value != _pass.text) {
                return "password incorrect";
              }
              return null;
            },
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 30.0)),
        Container(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(3.0)),
            child: Column(children: [
              DropdownButtonHideUnderline(
                child: Visibility(
                  visible: true,
                  child: DropdownButton2(
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      isVisible = true;
                      setState(() {
                        selectedValue = value!;
                        if (selectedValue == selectedValue1) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Result'),
                              content: const Text('select other item'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Ok'))
                              ],
                            ),
                          );
                        }
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 400,
                    itemHeight: 40,
                  ),
                ),
              ),
            ])),
        const Padding(padding: EdgeInsets.only(top: 30.0)),
        Visibility(
          visible: isVisible,
          child: SizedBox(
            width: 300.0,
            child: TextFormField(
              controller: _anwer,
              decoration: InputDecoration(
                labelText: "Answer",
                prefixIcon: const Icon(Icons.question_answer,
                    color: Color.fromARGB(255, 192, 136, 202)),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
                contentPadding: const EdgeInsets.only(left: 10.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "enter your Answer";
                }
                return null;
              },
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 30.0)),
         Container(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(3.0)),
            child: Column(children: [
              DropdownButtonHideUnderline(
                child: Visibility(
                  visible: true,
                  child: DropdownButton2(
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      isVisible1 = true;
                      setState(() {
                        selectedValue1 = value!;
                        if (selectedValue == selectedValue1) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Result'),
                              content: const Text('select other item'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Ok'))
                              ],
                            ),
                          );
                        }
                      });
                    },
                    value: selectedValue1,

                    buttonHeight: 40,
                    buttonWidth: 400,
                    itemHeight: 40,
                  ),
                ),
              ),
            ])),
        const Padding(padding: EdgeInsets.only(top: 30.0)),
        Visibility(
          visible: isVisible1,
          child: SizedBox(
            width: 300.0,
            child: TextFormField(
              controller: _anwer1,
              decoration: InputDecoration(
                labelText: "Answer",
                prefixIcon: const Icon(Icons.question_answer,
                    color: Color.fromARGB(255, 192, 136, 202)),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
                contentPadding: const EdgeInsets.only(left: 10.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "enter your Answer";
                }
                return null;
              },
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: white,
          ),
          onPressed: () {
            if (_fromkey.currentState!.validate()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
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
}
