import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({super.key, required this.title});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final signupFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: const Color.fromARGB(255, 202, 236, 229),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all((20)),
            child: CircleAvatar(
              radius: 48.0,
              backgroundImage: AssetImage(
                "images/daylee.jpg",
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Column(
                children: const [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              )),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: signupFormKey,
              child: Column(children: const [
              // Email Inputfield
              TextField(
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: "name@example.com",
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              TextField(
                decoration: InputDecoration(
                  label: Text("Age"),
                  hintText: "Age",
                ),
                keyboardType: TextInputType.number,
              ),

              TextField(
                decoration: InputDecoration(
                  label: Text("Gender"),
                  hintText: "Male",
                ),
                keyboardType: TextInputType.text,
              ),

              TextButton(
                onPressed: null,
                child: Text("Sign Up"),
                //  style: ButtonStyle(
                //   minimumSize:
              )
            ]),)
          ),
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            alignment: Alignment.centerRight,
            child: const Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
