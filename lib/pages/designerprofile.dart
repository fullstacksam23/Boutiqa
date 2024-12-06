import 'package:flutter/material.dart';
import 'package:boutiqa/pages/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:boutiqa/pages/auth_page.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:               Color.fromARGB(
            255, 212, 206, 200),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(
                  255, 212, 206, 200), // Very light grey/white at the top
              Color.fromARGB(255, 187, 141,
                  92), // Light grey to give a subtle 3D effect at the bottom
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                SizedBox(height: 20),

                // Profile Card with Gradient Background and Shadow
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 117, 40, 40), // Start color
                        Color.fromARGB(255, 110, 84, 84), // End color
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Zayanya',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'zayanyawilliams@gmail.com',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'view activity',
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  Icon(Icons.chevron_right,
                                      color: Color(0xFF7A4A39)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png', // Replace with actual image URL
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Favorites and Settings Buttons


                SizedBox(height: 30),

                // Options List
                OptionButton(
                  icon: Icons.contact_mail_outlined,
                  label: 'Messenger',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()),);
                  },
                  buttonColor: Color.fromARGB(255, 230, 230, 230),
                  textColor: Colors.black,
                  iconColor: Colors.black,
                ),
                OptionButton(
                  icon: Icons.person_outline,
                  label: 'Your clients',
                  onPressed: () {},
                  buttonColor: Color.fromARGB(255, 231, 230, 230),
                  textColor: Colors.black,
                  iconColor: Colors.black,
                ),
                OptionButton(
                  icon: Icons.share_outlined,
                  label: 'Refer us',
                  onPressed: () {},
                  buttonColor: Color.fromARGB(255, 230, 230, 230),
                  textColor: Colors.black,
                  iconColor: Colors.black,
                ),

                Spacer(),

                // Logout Button
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const AuthPage()),
                            (Route<dynamic> route) => false,
                      );
                    },
                    icon: Icon(Icons.logout),
                    label: Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(183, 113, 31, 31),
                      foregroundColor: Color.fromARGB(255, 240, 237, 236),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color iconColor;

  const CircleIconButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: backgroundColor,
            padding: EdgeInsets.all(20),
          ),
          child: Icon(icon, color: iconColor),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Color(0xFF7A4A39))),
      ],
    );
  }
}

class OptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final Color iconColor;

  const OptionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
          elevation: 1,
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(color: textColor),
              ),
            ),
            Icon(Icons.chevron_right, color: iconColor),
          ],
        ),
      ),
    );
  }
}
