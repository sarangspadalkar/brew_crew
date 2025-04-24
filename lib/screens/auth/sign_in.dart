import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _signInFormKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            onPressed: () {
              widget.toggleView();
            },
            label: Text("Register"),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _signInFormKey,
          child: Column(
            children: <Widget>[
              /**Email */
              SizedBox(height: 20.0),
              TextFormField(
                validator:
                    (value) =>
                        value == null || !EmailValidator.validate(value)
                            ? "Enter valid email"
                            : null,
                onChanged: (value) {
                  setState(() => email = value);
                  print("email ${email}");
                },
              ),

              /**Password */
              SizedBox(height: 20.0),
              TextFormField(
                validator:
                    (value) =>
                        value == null || value == "" ? "Password empty" : null,
                onChanged: (value) {
                  setState(() => password = value);
                  print("password ${password}");
                },
                obscureText: true,
              ),

              /**Submit Button */
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () async {
                  bool? validation = _signInFormKey.currentState?.validate();
                  if (validation != true) {
                    return;
                  }

                  User? user = await _auth.signInUser(email, password);

                  if (user == null) {
                    setState(() => error = "Error during Sign In");
                  }
                },
                child: Text("Sign In", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 12.0),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
