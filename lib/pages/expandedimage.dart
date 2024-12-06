import 'package:flutter/material.dart';

class ExpandedImagePage extends StatefulWidget {
  final String imageUrl;
  final String message;
  final String user;
  final String description; // Add description to the constructor

  const ExpandedImagePage({
    super.key,
    required this.imageUrl,
    required this.message,
    required this.user,
    required this.description, // Make sure description is passed
  });

  @override
  State<ExpandedImagePage> createState() => _ExpandedImagePageState();
}

class _ExpandedImagePageState extends State<ExpandedImagePage> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        backgroundColor: const Color(0xFF8B5E3C),
      ),
      backgroundColor: const Color(0xFFF6EDE5),
      body: Center(
        child: Container(
          width: 400, // Increased card width
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
              // Clickable Image
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(imagePath: widget.imageUrl),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 350, // Increased height
                    alignment: Alignment.topCenter,
                  ),
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
                    child: Text(
                      widget.user, // Display the dynamic user name
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.message, // Display the dynamic message
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 15),
              Text(
                widget.description, // Display the dynamic description
                textAlign: TextAlign.left,
                style: const TextStyle(
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

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context); // Close full-screen image on tap
        },
        child: Center(
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain, // Ensure the whole image is visible
          ),
        ),
      ),
    );
  }
}
