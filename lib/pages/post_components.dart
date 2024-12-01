import 'package:flutter/material.dart';
class WallPosts extends StatelessWidget {

  final String message;
  final String user;

  const WallPosts({
    super.key,
    required this.message,
    required this.user,

  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
          child: Center(
            child: Column(
              children: [
                Container(
                    child: Image.network("https://idaho-o.com/wp-content/uploads/2023/12/image-66.png"),
                    height: 500,
                    width: 200
                ),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      Text(
                        "Designed by : ",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF8B5E3C),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          user,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }
}

