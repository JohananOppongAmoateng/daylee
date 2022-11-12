import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
          Padding(padding: EdgeInsets.fromLTRB(0, 30,0,15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
            size: Size.fromRadius(48), // Image radius
             child: Image.asset("images/daylee.jpg")),
             ),
             ),
         Padding(padding: EdgeInsets.all(15)),
           Text("Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
            ),

        Padding(padding: EdgeInsets.all(15)),

          Container(
            margin: const EdgeInsets.all(15.0),
            child: Form(
              key:loginFormKey,
              child: Column(
                children: [
               // Email Inputfield
              TextFormField(
                controller: _emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(
              Radius.circular(0.0)),
              borderSide: BorderSide(color: Colors.black,width: 1.0)
              ),
            label: Text("Email"),
              hintText: "name@example.com",
              contentPadding: EdgeInsets.all(6.0)
          ),
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]
            ),
          ),
            Padding(padding: EdgeInsets.all(15)),

          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(
              Radius.circular(0.0)),
              borderSide: BorderSide(color: Colors.black,width: 1.0)
              ),
            label: Text("Age"),
              hintText: "Age",
              contentPadding: EdgeInsets.all(6.0)
          ),
            keyboardType: TextInputType.number,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
              ]
            ),
          ),
        Padding(padding: EdgeInsets.all(10)),

        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(
              Radius.circular(0.0)),
              borderSide: BorderSide(color: Colors.black,width: 1.0)
              ),
            label: Text("Password"),
            hintText: "Password",
              contentPadding: EdgeInsets.all(6.0)
          ),
            keyboardType: TextInputType.text,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(8),
              ]
            ),
          ),
        
        Padding(padding: EdgeInsets.all(15)),

        TextButton(onPressed: (){
          if (loginFormKey.currentState!.validate()) {
                        _loginwithEmailandPassword(_emailController.text,_passwordController.text);
        }
        }, child: Text('Log In',
        style: TextStyle(color: Colors.white),
       ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          
          // padding: EdgeInsets.all(10.0),
    
        )
        ),
        ]),
      ),
      ),])
    );
  }
  
  Future _loginwithEmailandPassword(String email,String password) async{
try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}

  }
}
