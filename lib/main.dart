import 'package:flutter/material.dart';
import 'package:hack/providers/authenticationService.dart';
import 'package:hack/providers/canteen_provider.dart';
import 'package:hack/screens/home_screen.dart';
import 'package:hack/screens/login_screen.dart';
import 'package:hack/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CanteenProvider()),
        ChangeNotifierProvider(
            create: (ctx) =>
                AuthenticationService(firebaseAuth: FirebaseAuth.instance)),
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
          home: StreamBuilder<dynamic>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data == null) {
                  return const LoginScreen();
                }
                return const HomeScreen();
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          )),
    );
  }
}
