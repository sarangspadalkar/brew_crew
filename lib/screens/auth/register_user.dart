import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class RegisterUser extends StatefulWidget {
  final Function toggleView;

  RegisterUser({super.key, required this.toggleView});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final AuthService _auth = AuthService();
  final _registerFormKey = GlobalKey<FormState>();

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
          key: _registerFormKey,
          child: Column(
            children: <Widget>[
              /**Email */
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(hintText: 'email'),
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
                decoration: InputDecoration(hintText: 'password'),
                validator:
                    (value) =>
                        value == null || value.length < 6
                            ? "Enter Password 6+ chars long"
                            : null,
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
                  bool? validation = _registerFormKey.currentState?.validate();
                  if (validation != true) {
                    return;
                  }

                  User? user = await _auth.registerUser(email, password);

                  if (user == null) {
                    setState(() => error = "please supply valid user");
                  }
                },
                child: Text("Register", style: TextStyle(color: Colors.white)),
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
