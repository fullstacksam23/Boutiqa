import 'package:flutter/material.dart';
import 'package:boutiqa/pages/customization2.dart';

class UserCustomization extends StatefulWidget {
  @override
  _UserCustomizationState createState() => _UserCustomizationState();
}

class _UserCustomizationState extends State<UserCustomization> {
  String? selectedStyle;
  String? selectedFabric;
  String? selectedPattern;
  String? selectedNeck;
  String? selectedSleeves;
  TextEditingController additionalChangesController = TextEditingController();

  final List<String> styles = ['Casual', 'Formal', 'Sporty'];
  final List<String> fabrics = ['Cotton', 'Polyester', 'Silk'];
  final List<String> patterns = ['Striped', 'Plain', 'Checkered'];
  final List<String> necks = ['Round', 'V-Neck', 'Collared'];
  final List<String> sleeves = ['Short', 'Long', 'Sleeveless'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize'),
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
                size: Size(24, 24),
                painter: TrianglePainter(),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choose your style',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            buildDropdown('Style', styles, selectedStyle, (value) {
              setState(() => selectedStyle = value);
            }),
            buildDropdown('Fabric', fabrics, selectedFabric, (value) {
              setState(() => selectedFabric = value);
            }),
            buildDropdown('Pattern', patterns, selectedPattern, (value) {
              setState(() => selectedPattern = value);
            }),
            buildDropdown('Neck', necks, selectedNeck, (value) {
              setState(() => selectedNeck = value);
            }),
            buildDropdown('Sleeves', sleeves, selectedSleeves, (value) {
              setState(() => selectedSleeves = value);
            }),
            SizedBox(height: 20),
            TextField(
              controller: additionalChangesController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Additional changes',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseDesignerScreen()),);
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, String? selectedItem,
      ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        value: selectedItem,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

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



//
// class UserCustomization extends StatefulWidget {
//   @override
//   _UserCustomizationState createState() => _UserCustomizationState();
// }
//
// class _UserCustomizationState extends State<UserCustomization> {
//   int _selectedIndex = 0;
//
//   // To track the selected button for each section
//   String selectedNeck = '';
//   String selectedSleeves = '';
//
//   // Method to handle the bottom navigation tap
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // This removes the debug banner
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Customize',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 24,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Neck section
//                 Text(
//                   'Neck',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 12),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       buildOptionButton('V-neck', selectedNeck,
//                           'https://via.placeholder.com/40', true),
//                       buildOptionButton('Asymmetric', selectedNeck,
//                           'https://via.placeholder.com/40', true),
//                       buildOptionButton('Halter', selectedNeck,
//                           'https://via.placeholder.com/40', true),
//                       buildOptionButton('Strapless', selectedNeck,
//                           'https://via.placeholder.com/40', true),
//                       buildOptionButton('Others', selectedNeck,
//                           'https://via.placeholder.com/40', true),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 24), // Added more space between sections
//                 // Sleeves section
//                 Text(
//                   'Sleeves',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 12),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       buildOptionButton('Spaghetti', selectedSleeves,
//                           'https://via.placeholder.com/40', false),
//                       buildOptionButton('Bishop', selectedSleeves,
//                           'https://via.placeholder.com/40', false),
//                       buildOptionButton('Offshoulder', selectedSleeves,
//                           'https://via.placeholder.com/40', false),
//                       buildOptionButton('Layered', selectedSleeves,
//                           'https://via.placeholder.com/40', false),
//                       buildOptionButton('Others', selectedSleeves,
//                           'https://via.placeholder.com/40', false),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                     height: 24), // Added more space before the last section
//                 // Ideas in your mind section
//                 Text(
//                   'Ideas in your mind',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 15),
//                 Container(
//                   height: 160,
//                   width: 280,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black, width: 1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Center(
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.add_circle_outline),
//                             onPressed: () {
//                               // Add your functionality here
//                             },
//                           ),
//                           Text(
//                             'Add Your Image',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.add_box),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.notifications),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: '',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.black,
//           unselectedItemColor: Colors.grey,
//           onTap: _onItemTapped,
//         ),
//       ),
//     );
//   }
//
//   // Helper method to create a button with an image
//   Widget buildOptionButton(String title, String selected, String imageUrl, bool isNeck) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//         child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     if (isNeck) {
//                       selectedNeck = title;
//                     } else {
//                       selectedSleeves = title;
//                     }
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(70, 70), // Ensures all buttons are the same size
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     side: BorderSide(
//                       color: (isNeck ? selectedNeck : selectedSleeves) == title
//                           ? Colors.blue
//                           : Colors.black,
//                       width: (isNeck ? selectedNeck : selectedSleeves) == title
//                           ? 2
//                           : 1,
//                     ),
//                   ),
//
//                   backgroundColor: (isNeck ? selectedNeck : selectedSleeves) == title
//                       ? Colors.blue.withOpacity(0.3)
//                       : Colors.white,
//                 ),
//                 child: Image.network(imageUrl, fit: BoxFit.cover),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 14),
//               ),
//             ],
//             ),
//         );
//     }
// }