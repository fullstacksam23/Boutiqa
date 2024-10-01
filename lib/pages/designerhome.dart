import 'package:flutter/material.dart';
import 'package:boutiqa/pages/homepage.dart';
import 'package:boutiqa/pages/search.dart';
import 'package:boutiqa/pages/gender.dart';
import 'package:boutiqa/pages/designerprofile.dart';
import 'package:boutiqa/pages/designer_activity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DesignFirstPage extends StatefulWidget {
  const DesignFirstPage({super.key});

  @override
  State<DesignFirstPage> createState() => _DesignFirstPageState();
}

class _DesignFirstPageState extends State<DesignFirstPage> {
  int _currentIndex = 0;
  final tabs = [
    MyHomePage(),
    SearchPage(),
    CustomizeScreen(),
    DesignerActivity(),
    ProfileScreen(),
  ];
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boutiqa"),
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
