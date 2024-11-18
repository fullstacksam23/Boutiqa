import 'package:flutter/material.dart';
import 'package:boutiqa/pages/chat.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFF7A4A39)),
                  onPressed: () {},
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleIconButton(
                      icon: Icons.settings,
                      label: 'Settings',
                      onPressed: () {},
                      backgroundColor: Color.fromARGB(255, 104, 51, 51),
                      iconColor: Color.fromARGB(255, 249, 248, 247),
                    ),
                  ],
                ),

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
                    onPressed: () {},
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
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Icon(Icons.arrow_back, color: Colors.black),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: NetworkImage(
//                         'https://plus.unsplash.com/premium_photo-1669800502105-c181897af983?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZSUyMHBpY3R1cmUlMjBmcm9tJTIwZmlnbWF8ZW58MHx8MHx8fDA%3D'),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'username',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 32),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('posts',
//                     style:
//                     TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 Icon(Icons.add, size: 30),
//               ],
//             ),
//             SizedBox(height: 8),
//             Container(
//               height: 100,
//               width: 100,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       'https://plus.unsplash.com/premium_vector-1714148691898-adeeff1da61f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzZ8fG91dGZpdCUyMHNrZXRjaGVzfGVufDB8fDB8fHww'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 32),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text('designs sold',
//                     style:
//                     TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               ],
//             ),
//             SizedBox(height: 8),
//             Container(
//               height: 100,
//               width: 100,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       'https://plus.unsplash.com/premium_vector-1714148691906-4a9d6e3cf273?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG91dGZpdCUyMHNrZXRjaGVzfGVufDB8fDB8fHww'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//
//     );
//   }
// }