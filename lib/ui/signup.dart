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
          children:  [
           const CircleAvatar(
            radius: 48.0,
            backgroundImage: AssetImage("images/daylee.jpg",),
          ),

         
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: const [

               // Email Inputfield
              TextField(
            decoration: InputDecoration(
            label: Text("Email"),

              hintText: "name@example.com",
          ),
            keyboardType: TextInputType.emailAddress,
          ),


          TextField(decoration: InputDecoration(
            label: Text("Age"),
              hintText: "Age",
          ),
            keyboardType: TextInputType.number,
          ),


          TextField(decoration: InputDecoration(
            label: Text("Gender"),
              hintText: "Male",
          ),
            keyboardType: TextInputType.text,
          ),

          // TextButton(onPressed: null ,
          // style: ButtonStyle(
            
          // ),
          // child: Text("Sign Up")),

          // ElevatedButton(onPressed: onPressed, child: child)
            ]),
          ),],
      ),
    );
  }
}
