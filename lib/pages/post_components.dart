import 'package:flutter/material.dart';
import 'package:boutiqa/pages/expandedimage.dart';

class WallPosts extends StatefulWidget {
  final String caption;
  final String user;
  final String description;

  const WallPosts({
    super.key,
    required this.caption,
    required this.user,
    required this.description,
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
      likeCount += isLiked ? 1 : -1; // Increase or decrease like count based on like state
    });
  }

  void openExpandedView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExpandedImagePage(
          imageUrl: "assets/home_page_3.jpg", // Image Path
          message: widget.caption,
          user: widget.user,
          description: widget.description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/designer_profile.jpg",
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF8B5E3C),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    child: Text(
                      widget.user,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              // Image Section with GestureDetector for full-screen view
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: GestureDetector(
                  onTap: () => openExpandedView(context),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Image.asset(
                        alignment: Alignment.topCenter,
                        "assets/home_page_3.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              // Like and Message Section
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
                    '$likeCount Likes', // Displays the like count
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Message Text
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.caption,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
