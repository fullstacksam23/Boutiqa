import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _controller = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser!;
  void postMessage(){
    if(_controller.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("Designer Posts").add({
        "UserEmail": currentUser.email,
        "Message": _controller.text,
        "TimeStamp": Timestamp.now(),
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Column(
          children: [
            Text("Create a New Post", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.brown),),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Caption",
                  hintText: "Enter your caption here",
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  postMessage();
                },
                child: Text("Upload", style: TextStyle(fontSize: 20, color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                minimumSize: Size(100, 50),
              ),
            ),
          ],
        )),
      ],
    );
  }
}
