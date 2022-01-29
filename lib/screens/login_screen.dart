import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hack/providers/authenticationService.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  String dropdownvalue = 'Student';

  final _textU = TextEditingController();
  final _textP = TextEditingController();
  bool _validateU = false;
  bool _validateP = false;

  void dispose() {
    _textU.dispose();
    _textP.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List items = [
      'Student',
      'Club',
      'Admin',
    ];
    final auth = Provider.of<AuthenticationService>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            const Center(
              child: Text(
                'Login',
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
                  // Dropdown
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(8),
                      isExpanded: true,
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownvalue = newValue.toString();
                        });
                      },
                      items: items.map((dynamic items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
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
                        errorText: _validateU ? 'Username is required' : null,
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
                        controller: _textP,
                        obscureText: true,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          errorText: _validateP ? 'Password is required' : null,
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

            // Login button
            if (dropdownvalue != 'Admin')
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton(
                  child: const Text(
                    'Login',
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
                    });
                    if (!_validateU && !_validateP) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                ),
              ),
            if (dropdownvalue != 'Admin')
              const Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

            // Login with Google
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                child: const Text(
                  'Login with Google',
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
                  });
                  if (!_validateU && !_validateP) {
                    auth
                        .login(email: _textU.text, password: _textP.text)
                        .then((value) {
                      Navigator.pushNamed(context, '/home');
                    });
                  }
                },
              ),
            ),

            // Signup option
            if (dropdownvalue != 'Admin')
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(context, '/signup');
                          },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
