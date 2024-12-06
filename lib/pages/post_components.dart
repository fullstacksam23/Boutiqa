import 'package:flutter/material.dart';
class WallPosts extends StatefulWidget {

  final String message;
  final String user;

  const WallPosts({
    super.key,
    required this.message,
    required this.user,

  });

  @override
  State<WallPosts> createState() => _WallPostsState();
}

class _WallPostsState extends State<WallPosts> {

  int likeCount = 0; // Tracks the number of likes
  bool isLiked = false; // Tracks if the post is liked

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/designer_profile.jpg"),
                ),
                SizedBox(width: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF8B5E3C),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    widget.user,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFF8B5E3C),
                ),
                clipBehavior: Clip.hardEdge,
                width: 400,
                height: 400,
                child: Image.asset(
                  "assets/home_page_3.jpg",
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: toggleLike,
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                ),
                Text(
                  widget.message,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),


          ],
        ),

    );
  }
}

