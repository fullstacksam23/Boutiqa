import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://plus.unsplash.com/premium_photo-1669800502105-c181897af983?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZSUyMHBpY3R1cmUlMjBmcm9tJTIwZmlnbWF8ZW58MHx8MHx8fDA%3D'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'username',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('posts',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(Icons.add, size: 30),
              ],
            ),
            SizedBox(height: 8),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://plus.unsplash.com/premium_vector-1714148691898-adeeff1da61f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzZ8fG91dGZpdCUyMHNrZXRjaGVzfGVufDB8fDB8fHww'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('designs sold',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://plus.unsplash.com/premium_vector-1714148691906-4a9d6e3cf273?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG91dGZpdCUyMHNrZXRjaGVzfGVufDB8fDB8fHww'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}