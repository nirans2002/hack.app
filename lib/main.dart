import 'package:flutter/material.dart';
import 'package:hack/screens/event_screen.dart';
import 'package:hack/screens/login_screen.dart';
import 'package:hack/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/event_details': (context) => const EventDetailsScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EventDetailsScreen(),
    );
  }
}
