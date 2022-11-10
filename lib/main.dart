import '/ui/signin.dart';
import 'package:flutter/material.dart';

import 'ui/signup.dart';



void main() {
  runApp(const DayleeApp());
}

class DayleeApp extends StatelessWidget {
  const DayleeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daylee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpScreen(title: 'Daylee App'),
      // home: const LoginScreen(),
    );
  }
}
