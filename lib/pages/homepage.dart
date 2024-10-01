import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BrowsePage(),
    CreatePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF1DE),
        elevation: 0,
        title: Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          // This is where the profile button was. It's now removed.
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10), // Add space below the app bar
          Container(
            height: 150, // Give a fixed height to the horizontal list
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xFFFFF1DE),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 30),
                CategoryItem(
                  label: 'Ethnic',
                  imageUrl:
                  'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
                ),
                SizedBox(width: 30), // Increased spacing
                CategoryItem(
                  label: 'Indian',
                  imageUrl:
                  'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
                ),
                SizedBox(width: 30), // Increased spacing
                CategoryItem(
                  label: 'Casual',
                  imageUrl:
                  'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
                ),
                SizedBox(width: 30), // Increased spacing
                CategoryItem(
                  label: 'Fusion',
                  imageUrl:
                  'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
                ),
                SizedBox(width: 30), // Increased spacing
                CategoryItem(
                  label: 'Co-ord',
                  imageUrl:
                  'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
                ),
                SizedBox(width: 30), // Increased spacing
                CategoryItem(
                  label: 'Lounge',
                  imageUrl:
                  'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
                ),
                SizedBox(width: 30),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileSection(), // Add ProfileSection widget here
                  _widgetOptions.elementAt(_selectedIndex),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSection extends StatefulWidget {
  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey, // Placeholder for profile image
                radius: 26, // Increased radius for larger profile icon
              ),
              SizedBox(width: 10), // Adjust spacing
              Text(
                'Profile Name',
                style: TextStyle(
                  fontSize: 22, // Increased font size for larger profile name
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Space between profile and rectangular box
          Center(
            child: Container(
              width: 250, // Increased width for longer rectangular box
              height: 300, // Adjusted height to avoid overflow
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final String label;
  final String imageUrl;

  CategoryItem({required this.label, required this.imageUrl});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 100, // Adjusted height to avoid overflow
            decoration: BoxDecoration(
              color: Color(0xFFFBBD71),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Color(0xFFFBBD71),
                  width: 5), // Thin border around the image
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page'),
    );
  }
}

class BrowsePage extends StatefulWidget {
  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Browse Page'),
    );
  }
}

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Create Page'),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Notifications Page'),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Page'),
    );
  }
}