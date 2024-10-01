import "package:flutter/material.dart";
import 'package:boutiqa/pages/designerorders.dart';
import 'package:boutiqa/pages/chat.dart';
import 'package:boutiqa/pages/followers.dart';
class DesignerActivity extends StatefulWidget {
  const DesignerActivity({super.key});

  @override
  State<DesignerActivity> createState() => _DesignerActivityState();
}

class _DesignerActivityState extends State<DesignerActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Text("activity", style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            Container(
              height: 50,
              width: 400,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserOrdersScreen()),);
                },
                child: Text("Orders History", style: TextStyle(color: Colors.black, fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color(0xffFFF1DE),
                ),
              ),
            ),
            SizedBox(height: 60,),
            Container(
              height: 50,
              width: 400,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()),);
                },
                child: Text("Messenger", style: TextStyle(color: Colors.black, fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color(0xffFFF1DE),
                ),
              ),
            ),
            SizedBox(height: 60,),
            Container(
              height: 50,
              width: 400,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FollowersScreen()),);
                },
                child: Text("Followers", style: TextStyle(color: Colors.black, fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color(0xffFFF1DE),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
