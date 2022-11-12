import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignUpScreen extends StatefulWidget {
  final String title;
  const SignUpScreen({super.key, required this.title});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final signupFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  
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
                child: Column(children: [
                  // Email Inputfield
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          borderSide: BorderSide(width: 1.0)),
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 3, 24, 54),
                          fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "name@example.com",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  TextFormField(
                      controller: _ageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
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
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ])),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          borderSide: BorderSide(width: 1.0)),
                      label: Text("Password"),
                      hintText: "password",
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 3, 24, 54),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ]),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  TextFormField(
                    controller: _confirmpasswordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          borderSide: BorderSide(width: 1.0)),
                      label: Text("Confirm Password"),
                      hintText: "Confirm password",
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 3, 24, 54),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                      FormBuilderValidators.equal(_passwordController.text)
                    ]),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  TextButton(
                    onPressed: () {
                      if (signupFormKey.currentState!.validate()) {
                        _signUpwithEmailandPassword(_emailController.text,_passwordController.text);
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.pink,
                        fixedSize: const Size(350.0, 20.0)),
                  )
                ]),
              )),
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


  Future _signUpwithEmailandPassword(String email, String password) async {
    try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}

  }
}
