import 'package:brew_crew/screens/auth/register_user.dart';
import 'package:brew_crew/screens/auth/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Container(child: SignIn(toggleView: toggleView));
    } else {
      return Container(child: RegisterUser(toggleView: toggleView));
    }
  }
}
