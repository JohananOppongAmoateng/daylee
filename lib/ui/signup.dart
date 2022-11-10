import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final String title;
  const SignUpScreen({super.key, required this.title});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final signupFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
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
                      color: Color.fromARGB(255, 3, 24, 54),
                      
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              )),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: signupFormKey,
              child: Column(children:[
              // Email Inputfield
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(width: 1.0)),
                  labelText:"Email",
                  
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 3, 24, 54),
                    fontWeight: FontWeight.bold
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "name@example.com",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              Padding(padding: EdgeInsets.all(10.0),),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(width: 1.0)),
                  label: Text("Age"),
                  hintText: "Age",
                   filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 3, 24, 54),
                    fontWeight: FontWeight.bold,
                    ),
                ),
                keyboardType: TextInputType.number,
              ),
              Padding(padding: EdgeInsets.all(10.0),),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(width: 1.0)),
                  label: Text("Gender"),
                  hintText: "Male",
                   filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 3, 24, 54),
                    fontWeight: FontWeight.bold,
                    ),
                ),
                keyboardType: TextInputType.text,
              ),

              Padding(padding: EdgeInsets.all(15.0),),
              TextButton(
                onPressed: null,
                child: Text("Sign Up",
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
                 style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                  fixedSize: Size(350.0, 20.0)
                 ),
              )
            ]),)
          ),
          Container(

            margin: const EdgeInsets.only(right: 40.0),
            alignment: Alignment.centerRight,
            child: const Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
