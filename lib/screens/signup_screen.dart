import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hack/providers/authenticationService.dart';
import 'package:provider/provider.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreen createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  String dropdownvalue = 'Student';
  String dropdownvalueC = 'College of Engineering, Trivandrum';
  final _textN = TextEditingController();
  bool _validateN = false;
  final _textU = TextEditingController();
  bool _validateU = false;
  final _textP = TextEditingController();
  bool _validateP = false;
  final _textPh = TextEditingController();
  bool _validatePh = false;
  void dispose() {
    _textU.dispose();
    _textP.dispose();
    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var items = [
      'Student',
      'Club',
    ];
    var colleges = [
      'College of Engineering, Trivandrum',
      'Other',
    ];
    final auth = Provider.of<AuthenticationService>(context,listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                        // Role
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16,
                              ),
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              underline: Container(),
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
                        ),

                        // Name
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: TextFormField(
                            controller: _textN,
                            keyboardType: TextInputType.text,
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

                        // Phone No
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _textPh,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Phone Number',
                              errorText:
                                  _validatePh ? 'Invalid Phone number' : null,
                            ),
                            validator: (value) {
                              if (value == null) {
                                return "Please enter some value";
                              }
                            },
                          ),
                        ),

                        // College
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16,
                              ),
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              underline: Container(),
                              value: dropdownvalueC,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalueC = newValue!;
                                });
                              },
                              items: colleges.map((String colleges) {
                                return DropdownMenuItem(
                                  value: colleges,
                                  child: Text(colleges),
                                );
                              }).toList(),
                            ),
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
                              errorText:
                                  _validateU ? 'Username required' : null,
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
                                errorText:
                                    _validateP ? 'Password required' : null,
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
                        // isLoading = true;
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
                          _textPh.text.length != 10
                              ? _validatePh = true
                              : _validatePh = false;
                        });
                        if (!_validateU &&
                            !_validateP &&
                            !_validateN &&
                            !_validatePh) {
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: SignInButton(
                      Buttons.GoogleDark,
                      text: "Sign up with Google",
                      onPressed: () {
                        Null;
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
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
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
