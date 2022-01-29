import 'package:flutter/material.dart';

import 'package:hack/providers/canteen_provider.dart';
import 'package:hack/screens/canteen.dart';
import 'package:hack/screens/event_list_screen.dart';
import 'package:hack/screens/event_screen.dart';
import 'package:hack/screens/home_screen.dart';

import 'package:hack/screens/login_screen.dart';
import 'package:hack/screens/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CanteenProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/home': (context) => const HomeScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
