import 'package:firebase_auth/firebase_auth.dart';

import "package:flutter/material.dart";

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({Key? key, required this.onTap}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  //signin method
  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //WRONG EMAIL
      showErrorMessage();
    }
  }

  void showErrorMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.purple,
            title: Text('Incorrect details'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFF1DE),
      ),
      body: Container(
        color: Color(0xffFFF1DE),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(image: AssetImage("assets/logo.png")),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFF1DE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "username",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFF1DE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: signUserIn,
                child: Container(
                    child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),
              //Text("or", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 100),
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Sign Up here",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                // child: ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(builder: (context) => const SignUp()),
                //     );
                //   },
                //   child: Container(
                //       child: GestureDetector(
                //     onTap: widget.onTap,
                //     child: Text(
                //       "Sign Up",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   )),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.black,
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
