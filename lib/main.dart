import 'package:flutter/material.dart';
import 'ui/signup.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Future<void> main() async{
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
//   runApp(const DayleeApp());
// }

void main(){
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
