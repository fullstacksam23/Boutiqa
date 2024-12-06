import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LikeButtonExample(),
    );
  }
}

class LikeButtonExample extends StatefulWidget {
  const LikeButtonExample({super.key});

  @override
  _LikeButtonExampleState createState() => _LikeButtonExampleState();
}

class _LikeButtonExampleState extends State<LikeButtonExample> {
  bool isLiked = false; // State to track the like button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EDE5), // Light pastel background
      body: Center(
        child: Container(
          width: 350, // Larger width
          padding: const EdgeInsets.all(20), // Spacious padding
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://via.placeholder.com/350x450', // Replace with your image URL
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300, // Increased height
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked; // Toggle the like state
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey, // Change color
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFBA7856), // Brownish color
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'sam1',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Designed By: sam1\nfabric : Chiffon\nBeadwork highlights the neckline and borders, while panel stitching adds volume to the skirt. A matching embroidered dupatta completes the look.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}