import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreen createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(30, 8, 20, 500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Colors.black;
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue.shade100,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(children: const [
                    Icon(Icons.person, color: Colors.black),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue.shade100,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(children: const [
                  Icon(
                    Icons.info_rounded,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'About US',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue.shade100,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(children: const [
                  Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
