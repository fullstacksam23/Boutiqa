import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _captionController = TextEditingController(); // For caption
  final _descriptionController = TextEditingController(); // For description
  final currentUser = FirebaseAuth.instance.currentUser!;

  void postMessage() async {
    if (_captionController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
      try {
        // Fetch the username from Firestore using the current user's UID
        String uid = currentUser.uid;
        DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

        String? username = userDoc['username']; // Assuming 'username' is the field name in Firestore

        // Add the post with the username, caption, and description
        await FirebaseFirestore.instance.collection("Designer Posts").add({
          "Username": username,
          "Caption": _captionController.text,
          "Description": _descriptionController.text,
          "TimeStamp": Timestamp.now(),
        });

        // Clear the text fields after successful post
        setState(() {
          _captionController.clear();
          _descriptionController.clear();
        });
      } catch (e) {
        // Handle any errors
        print("Error posting message: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Text(
                "Create a New Post",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: TextField(
                  controller: _captionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Caption",
                    hintText: "Enter your caption here",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: TextField(
                  controller: _descriptionController,
                  maxLines: 4, // Allows multi-line input for the description
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Description",
                    hintText: "Enter the description here",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  postMessage();
                },
                child: Text(
                  "Upload",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  minimumSize: Size(100, 50),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
