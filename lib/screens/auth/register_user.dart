import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  final Function toggleView;

  RegisterUser({super.key, required this.toggleView});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign Up to Brew Crew"),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            onPressed: () {
              widget.toggleView();
            },
            label: Text("Sign In"),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              /**Email */
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value) {
                  setState(() => email = value);
                  print("email ${email}");
                },
              ),

              /**Password */
              SizedBox(height: 20.0),
              TextFormField(
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
                onPressed: () async {},
                child: Text("Register", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
