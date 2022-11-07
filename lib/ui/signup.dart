import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({super.key, required this.title});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 48.0,
            backgroundImage: AssetImage("images/daylee.jpg",),
          )
        ],
      ),
    );
  }
}
