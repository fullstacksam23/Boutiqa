import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:boutiqa/pages/userorders.dart';
import 'package:boutiqa/pages/chat.dart';
import 'package:boutiqa/pages/edit_profile.dart';

class UserProfile extends StatelessWidget {
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
                                children: [ElevatedButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfilePage()),);
                                },
                                  child: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),),

                                  Icon(
                                      Icons.chevron_right,
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
                  icon: Icons.shopping_bag_outlined,
                  label: 'Your orders',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryPage()),);
                  },
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
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
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



// class UserProfile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFFF5F5F5), // Very light grey/white at the top
//               Color(
//                   0xFFE0E0E0), // Light grey to give a subtle 3D effect at the bottom
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Back Button
//                 IconButton(
//                   icon: Icon(Icons.arrow_back, color: Color(0xFF7A4A39)),
//                   onPressed: () {},
//                 ),
//                 SizedBox(height: 20),
//
//                 // Profile Card
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 125, 59, 59),
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 10,
//                         offset: Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Zayanya',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                               ),
//                             ),
//                             Text(
//                               'zayanyawilliams@gmail.com',
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                             SizedBox(height: 8),
//                             GestureDetector(
//                               onTap: () {},
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'view activity',
//                                     style: TextStyle(
//                                       color: Color.fromARGB(255, 255, 255, 255),
//                                       decoration: TextDecoration.underline,
//                                     ),
//                                   ),
//                                   Icon(Icons.chevron_right,
//                                       color: Color(0xFF7A4A39)),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 16),
//                       CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage(
//                           'https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png', // Replace with actual image URL
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: 30),
//
//                 // Favorites and Settings Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     CircleIconButton(
//                       icon: Icons.settings,
//                       label: 'Settings',
//                       onPressed: () {},
//                       backgroundColor: Color.fromARGB(
//                           255, 104, 51, 51), // Silver-toned button color
//                       iconColor:
//                       Color.fromARGB(255, 249, 248, 247), // Dark brown icon
//                     ),
//                   ],
//                 ),
//
//                 SizedBox(height: 30),
//
//                 // Options List
//                 OptionButton(
//                   icon: Icons.contact_mail_outlined,
//                   label: 'Messenger',
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()),);
//                   },
//                   buttonColor: Color.fromARGB(255, 230, 230, 230),
//                   textColor: Color(0xFF7A4A39),
//                   iconColor: Color(0xFF7A4A39),
//                 ),
//                 OptionButton(
//                   icon: Icons.shopping_bag_outlined,
//                   label: 'Your orders',
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryPage()),);
//                   },
//                   buttonColor: Color.fromARGB(
//                       255, 231, 230, 230), // Silver-toned button background
//                   textColor: Color(0xFF7A4A39),
//                   iconColor: Color(0xFF7A4A39),
//                 ),
//                 OptionButton(
//                   icon: Icons.share_outlined,
//                   label: 'Refer us',
//                   onPressed: () {},
//                   buttonColor: Color.fromARGB(255, 230, 230, 230),
//                   textColor: Color.fromRGBO(122, 74, 57, 1),
//                   iconColor: Color(0xFF7A4A39),
//                 ),
//
//                 Spacer(),
//
//                 // Logout Button
//                 Center(
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       FirebaseAuth.instance.signOut();
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(Icons.logout),
//                     label: Text('Logout'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(
//                           183, 113, 31, 31), // Silver-toned button background
//                       foregroundColor: Color.fromARGB(
//                           255, 240, 237, 236), // Dark brown text color
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       padding:
//                       EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CircleIconButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback onPressed;
//   final Color backgroundColor;
//   final Color iconColor;
//
//   const CircleIconButton({
//     Key? key,
//     required this.icon,
//     required this.label,
//     required this.onPressed,
//     required this.backgroundColor,
//     required this.iconColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: onPressed,
//           style: ElevatedButton.styleFrom(
//             shape: CircleBorder(),
//             backgroundColor: backgroundColor, // Silver-toned button color
//             padding: EdgeInsets.all(20),
//           ),
//           child: Icon(icon, color: iconColor), // Dark brown icon
//         ),
//         SizedBox(height: 8),
//         Text(label,
//             style: TextStyle(color: Color(0xFF7A4A39))), // Dark brown text
//       ],
//     );
//   }
// }
//
// class OptionButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback onPressed;
//   final Color buttonColor;
//   final Color textColor;
//   final Color iconColor;
//
//   const OptionButton({
//     Key? key,
//     required this.icon,
//     required this.label,
//     required this.onPressed,
//     required this.buttonColor,
//     required this.textColor,
//     required this.iconColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 6),
//         child: ElevatedButton(
//             onPressed: onPressed,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: buttonColor, // Silver-toned button background
//               foregroundColor: textColor, // Dark brown text color
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: EdgeInsets.symmetric(vertical: 16),
//               elevation: 1,
//             ),
//             child: Row(
//               children: [
//                 Icon(icon, color: iconColor), // Dark brown icon color
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Text(
//                     label,
//                     style: TextStyle(color: textColor),
//                   ),
//                 ),
//                 Icon(Icons.chevron_right,
//                     color: iconColor), // Dark brown arrow color
//               ],
//             ),
//             ),
//         );
//     }
// }



// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// class UserProfile extends StatefulWidget {
//   @override
//   _UserProfileState createState() => _UserProfileState();
// }
//
// class _UserProfileState extends State<UserProfile> {
//   int _selectedIndex = 0;
//   final currentUser = FirebaseAuth.instance.currentUser!;
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Text("Logged in as: "+currentUser.email!),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20.0),
//                 child: Text(
//                   'profile',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(
//                     'https://cdn.pixabay.com/photo/2016/01/25/19/48/man-1161337_640.jpg'), // Replace with the actual image URL
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'username',
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//               SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Saved designs',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'Customisations',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Image.network(
//                       'https://cdn.pixabay.com/photo/2021/02/19/13/42/woman-6030238_640.png', // Replace with the actual image URL
//                       width: 200,
//                       height: 200,
//                     ),
//                     Image.network(
//                       'https://cdn.pixabay.com/photo/2021/02/19/13/42/woman-6030239_640.png', // Replace with the actual image URL
//                       width: 200,
//                       height: 200,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'following',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 80.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundImage: NetworkImage(
//                           'https://cdn.pixabay.com/photo/2017/08/06/05/45/people-2589193_640.jpg'), // Replace with the actual image URL
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }