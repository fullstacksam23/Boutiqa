import 'package:flutter/material.dart';

class CustomizeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userModelCurrentInfo = UserModel(gender: 'Male'); // Example user info

    return Scaffold(
      appBar: AppBar(
        title: Text('Customize'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(155, 136, 97, 92),
        elevation: 2,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Customize',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            InfoDesignUIWidget(
              textInfo: 'Male',
              iconData: Icons.male_rounded,
            ),
            SizedBox(height: 20),
            InfoDesignUIWidget(
              textInfo: 'Female',
              iconData: Icons.female_rounded,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoDesignUIWidget extends StatelessWidget {
  final String textInfo;
  final IconData iconData;

  InfoDesignUIWidget({required this.textInfo, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, size: 100),
        SizedBox(height: 10),
        Text(
          textInfo,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class UserModel {
  final String gender;

  UserModel({required this.gender});
}