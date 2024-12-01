import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  final Function()? onTap;
  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  bool _obscurePassword = true;

  // To keep track of user type selection
  String selectedProfileType = 'user';
  //signin method
  void signUserUp() async {
    // show loading circle
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(child: CircularProgressIndicator(),);
        });

    try {
      if(_passwordController.text != _confirmpasswordController.text){
        throw Exception("Passwords don't match");
      }
      if (_passwordController.text == _confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _usernameController.text,
          password: _passwordController.text,
        );

        // Dismiss the loading dialog
        Navigator.pop(context);

        // Based on the selected profile type, navigate to the appropriate page
        if (selectedProfileType == 'user') {
          Navigator.pushReplacementNamed(context, '/userhome');
        } else{
          Navigator.pushReplacementNamed(context, '/designerhome');
        };
      }
      // else {
      //   Navigator.pop(context);
      //   print("wrong gmail");
      //   showErrorMessage();
      // }
    } catch (e) {
      Navigator.pop(context);
      //WRONG EMAIL
      print("wrong email");
      showErrorMessage();
    }
  }

  void showErrorMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.white,
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
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "Choose your account type",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image(image: AssetImage("assets/signup.png"), width: 250, height: 250,),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ToggleButtons(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('User'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Designer'),
                    ),
                  ],
                  isSelected: [
                    selectedProfileType == 'user',
                    selectedProfileType == 'designer',
                  ],
                  onPressed: (int index) {
                    setState(() {
                      selectedProfileType = index == 0 ? 'user' : 'designer';
                    });
                  },
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _confirmpasswordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFF1DE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "confirm password",
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
                onPressed: signUserUp,
                child: Container(
                    child: Text(
                  "Signup",
                  style: TextStyle(color: Colors.white),
                )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),
              //Text("or", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: TextButton(
                  onPressed: widget.onTap,
                  child: Text(
                    "Login here",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ),
              SizedBox(
                height: 600,
              )
            ],
          ),
        ),
      ),
    );
  }
}


// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Text(
//               "Choose your account type",
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Image(image: AssetImage("assets/signup.png")),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text("user"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => DesignFirstPage()),
//                       );
//                     },
//                     child: Text("designer"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextField(
//                     controller: _nameController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Color(0xffFFF1DE),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: "Name",
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextField(
//                     controller: _usernameController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Color(0xffFFF1DE),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: "username",
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextField(
//                     controller: _passwordController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Color(0xffFFF1DE),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: "create password",
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => firstpage()),
//                       );
//                     },
//                     child: Text("sign up"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
