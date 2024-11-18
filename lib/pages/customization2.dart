import 'package:flutter/material.dart';

class ChooseDesignerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            // Add your back navigation logic here
          },
          child: Container(
            margin: EdgeInsets.all(8.0), // Adjust for padding
            decoration: BoxDecoration(
              color: Colors.brown,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomPaint(
                size: Size(16, 16), // Adjust the size of the triangle
                painter: TrianglePainter(),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choose your designer',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              height: 60, // Increase the height of the search container
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Search',
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Add your send request logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown, // Background color
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'SEND REQUEST',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TrianglePainter class for drawing the triangle
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 4, size.height / 2); // Left point
    path.lineTo(3 * size.width / 4, size.height / 4); // Top right point
    path.lineTo(3 * size.width / 4, 3 * size.height / 4); // Bottom right point
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}