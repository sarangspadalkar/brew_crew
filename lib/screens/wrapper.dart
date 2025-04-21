import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/auth/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    print("Wrapper User: ${user?.uid}");

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
