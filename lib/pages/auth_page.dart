import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:boutiqa/pages/home.dart';
import "package:boutiqa/pages/login_or_register.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        //Checking if user logged in or not
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return firstpage();
          } else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
