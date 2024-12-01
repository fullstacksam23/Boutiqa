import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:boutiqa/pages/home.dart';
import "package:boutiqa/pages/login_or_register.dart";
import 'package:boutiqa/pages/designerhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  Future<String?> _getStoredProfileType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('profileType'); // Retrieve 'user' or 'designer'
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        //Checking if user logged in or not
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            // return firstpage();
            return DesignFirstPage();

          } else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
