import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:boutiqa/pages/post_components.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Designer Posts")
              .orderBy("TimeStamp", descending: false)
              .snapshots(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index){
                    final post = snapshot.data!.docs[index];
                    return WallPosts(message: post["Message"], user: post["UserEmail"]);
                  }
              );
            }else if(snapshot.hasError){
              return Center(child: Text("Error "+ snapshot.error.toString()),);
            }
            return const Center(child: CircularProgressIndicator(),);
          },
        ),
        ),
        
        Text("Logged in as: " + currentUser.email!),
      ],
    );
  }
}

class BrowseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Browse Page", style: TextStyle(fontSize: 24)),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Cart Page", style: TextStyle(fontSize: 24)),
    );
  }
}

class Customize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Customize Page", style: TextStyle(fontSize: 24)),
    );
  }
}
