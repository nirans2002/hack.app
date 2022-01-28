import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreen createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  // const LoginScreen({Key? key}) : super(key: key);

  // bool _isvisible = true;
  // @override
  // void showToast() {
  //   setState(() {
  //     _isVisible = !_isVisible;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Student';
    var items = [
      'Student',
      'Club',
      'Admin',
    ];

    return Scaffold(
      body: Container(
          margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),

              // Form
              Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: DropdownButton(
                        isExpanded: true,
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onChanged: (String? newValue) {
                          print(dropdownvalue);
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                      ),
                    ),

                    // Name
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Please enter some value";
                          }
                        },
                      ),
                    ),

                    // Username
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Please enter some value";
                          }
                        },
                      ),
                    ),

                    // Password
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Please enter some value";
                            }
                          },
                        )),
                  ],
                ),
              ),

              // Signup button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton(
                  child: const Text(
                    'SignUp',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),

              // Back option
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Back',
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/login');
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
