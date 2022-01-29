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
  String dropdownvalue = 'Student';
  final _textN = TextEditingController();
  bool _validateN = false;
  final _textU = TextEditingController();
  bool _validateU = false;
  final _textP = TextEditingController();
  bool _validateP = false;
  void dispose() {
    _textU.dispose();
    _textP.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var items = [
      'Student',
      'Club',
      // 'Admin',
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
                        borderRadius: BorderRadius.circular(8),
                        isExpanded: true,
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onChanged: (String? newValue) {
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
                        controller: _textN,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Name',
                          errorText: _validateN ? 'Name required' : null,
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
                        controller: _textU,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Username',
                          errorText: _validateU ? 'Username required' : null,
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
                          controller: _textP,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Password',
                            errorText: _validateP ? 'Password required' : null,
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
                    setState(() {
                      _textU.text.isEmpty
                          ? _validateU = true
                          : _validateU = false;
                      _textP.text.isEmpty
                          ? _validateP = true
                          : _validateP = false;
                      _textN.text.isEmpty
                          ? _validateN = true
                          : _validateN = false;
                    });
                    if (!_validateU && !_validateP && !_validateN) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                ),
              ),

              // OR
              const Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

              // Signup with Google
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton(
                  child: const Text(
                    'Sign up with Google',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    setState(() {
                      _textU.text.isEmpty
                          ? _validateU = true
                          : _validateU = false;
                      _textP.text.isEmpty
                          ? _validateP = true
                          : _validateP = false;
                      _textN.text.isEmpty
                          ? _validateN = true
                          : _validateN = false;
                    });
                    if (!_validateN && !_validateU && !_validateP) {
                      Navigator.pushNamed(context, '/home');
                    }
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
                            Navigator.pushReplacementNamed(context, '/login');
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
