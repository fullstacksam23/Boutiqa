import "package:flutter/material.dart";
import 'package:boutiqa/pages/chat.dart';
import 'package:boutiqa/pages/userorders.dart';
import 'package:boutiqa/pages/user_customization.dart';

class UserActivity extends StatefulWidget {
  const UserActivity({super.key});

  @override
  State<UserActivity> createState() => _UserActivityState();
}

class _UserActivityState extends State<UserActivity> {
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
                child: Text("Your Orders", style: TextStyle(color: Colors.black, fontSize: 20),),
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
                child: Text("Messages", style: TextStyle(color: Colors.black, fontSize: 20),),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserCustomization()),);
                },
                child: Text("Customization", style: TextStyle(color: Colors.black, fontSize: 20),),
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


