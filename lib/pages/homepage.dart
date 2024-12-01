import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> _isLiked = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Main Image
            buildImageCard(
              imageUrl:
              'https://images.unsplash.com/photo-1668371459824-094a960a227d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGluZGlhbiUyMHdlYXJ8ZW58MHx8MHx8fDA%3D',
              designer: "Yashwa Harivanam",
              index: 0,
            ),
            SizedBox(height: 16.0),

            // Additional Images
            buildImageCard(
              imageUrl:
              'https://idaho-o.com/wp-content/uploads/2023/12/image-66.png',
              designer: "Arjun Kumar",
              index: 1,
            ),
            SizedBox(height: 16.0),
            buildImageCard(
              imageUrl:
              'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-jacquard-lehenga-in-sea-green-v1-lqu1530.jpg',
              designer: "Priya Sharma",
              index: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageCard({
    required String imageUrl,
    required String designer,
    required int index,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color(0xFF8B5E3C),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            imageUrl,
            height: 600,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isLiked[index] = !_isLiked[index];
                });
              },
              icon: Icon(
                Icons.favorite,
                color: _isLiked[index] ? Colors.red : Colors.grey,
                size: 24.0,
              ),
            ),
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
                designer,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   color: Color(0xFF8B5E3C),
//                 ),
//                 clipBehavior: Clip.hardEdge,
//                 child: Image.network(
//                   'https://images.unsplash.com/photo-1668371459824-094a960a227d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGluZGlhbiUyMHdlYXJ8ZW58MHx8MHx8fDA%3D', // Replace with your main image URL
//                   height: 300,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Designed by : ",
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Color(0xFF8B5E3C),
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       padding:
//                       EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                       child: Text(
//                         "Lewis Hamilton",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                       onPressed: (){},
//                       icon: Icon(Icons.favorite),
//                       color: Colors.redAccent,
//                       iconSize: 30.0,
//                   ),
//                   // Icon(Icons.favorite, color: Colors.redAccent, size: 30.0),
//                   SizedBox(width: 16.0),
//                   Icon(Icons.share, color: Colors.grey, size: 30.0),
//                   SizedBox(width: 16.0),
//                   Icon(Icons.info_outline, color: Colors.grey, size: 30.0),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 clipBehavior: Clip.hardEdge,
//                 child: Image.asset(
//                     "assets/home_page_1",
//                 )
//               ),
//               SizedBox(height: 16,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Designed by : ",
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color(0xFF8B5E3C),
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     padding:
//                     EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                     child: Text(
//                       "Dab Designer",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.favorite, color: Colors.redAccent, size: 30.0),
//                   SizedBox(width: 16.0),
//                   Icon(Icons.share, color: Colors.grey, size: 30.0),
//                   SizedBox(width: 16.0),
//                   Icon(Icons.info_outline, color: Colors.grey, size: 30.0),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               Container(
//                 height: 600,
//                   width: 500,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     color: Color(0xFF8B5E3C),
//                   ),
//                   clipBehavior: Clip.hardEdge,
//                   child: Image.asset("assets/home_page_2", fit: BoxFit.cover,)
//               ),
//               SizedBox(height: 16.0),
//               SizedBox(height: 16,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Designed by : ",
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color(0xFF8B5E3C),
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     padding:
//                     EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                     child: Text(
//                       "Yashwa Harivanam",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.favorite, color: Colors.redAccent, size: 30.0),
//                   SizedBox(width: 16.0),
//                   Icon(Icons.share, color: Colors.grey, size: 30.0),
//                   SizedBox(width: 16.0),
//                   Icon(Icons.info_outline, color: Colors.grey, size: 30.0),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               Container(
//                   height: 600,
//                   width: 500,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     color: Color(0xFF8B5E3C),
//                   ),
//                   clipBehavior: Clip.hardEdge,
//                   child: Image.asset("assets/home_page_4", fit: BoxFit.cover,)
//               ),
//               SizedBox(height: 16,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Designed by : ",
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color(0xFF8B5E3C),
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     padding:
//                     EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                     child: Text(
//                       "Stylish Babu",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.favorite, color: Colors.redAccent, size: 30.0),
//                   SizedBox(width: 16.0),
//                   Icon(Icons.share, color: Colors.grey, size: 30.0),
//                   SizedBox(width: 16.0),
//                   Icon(Icons.info_outline, color: Colors.grey, size: 30.0),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//               // Expanded(
//               //   child: ListView(
//               //     scrollDirection: Axis.horizontal,
//               //     children: [
//               //       GestureDetector(
//               //         onTap: () {
//               //           print("Image 1 clicked");
//               //         },
//               //         child: Container(
//               //           margin: EdgeInsets.only(right: 10.0),
//               //           decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12.0),
//               //             color: Color(0xFFD4C4B2),
//               //           ),
//               //           child: Image.asset("assets/home_page_1")
//               //         ),
//               //       ),
//               //       GestureDetector(
//               //         onTap: () {
//               //           print("Image 2 clicked");
//               //         },
//               //         child: Container(
//               //           margin: EdgeInsets.only(right: 10.0),
//               //           decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12.0),
//               //             color: Color(0xFFD4C4B2),
//               //           ),
//               //           child: Image.asset("assets/home_page_2")
//               //         ),
//               //       ),
//               //       GestureDetector(
//               //         onTap: () {
//               //           print("Image 3 clicked");
//               //         },
//               //         child: Container(
//               //           margin: EdgeInsets.only(right: 10.0),
//               //           decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12.0),
//               //             color: Color(0xFFD4C4B2),
//               //           ),
//               //           child: Image.asset("assets/home_page_3")
//               //         ),
//               //       ),
//               //       GestureDetector(
//               //         onTap: () {
//               //           print("Image 4 clicked");
//               //         },
//               //         child: Container(
//               //           margin: EdgeInsets.only(right: 10.0),
//               //           decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12.0),
//               //             color: Color(0xFFD4C4B2),
//               //           ),
//               //           child: Image.asset("assets/home_page_4")
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BrowseScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Browse Page", style: TextStyle(fontSize: 24)),
//     );
//   }
// }
//
// class CartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Cart Page", style: TextStyle(fontSize: 24)),
//     );
//   }
// }
//
// class Customize extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Customize Page", style: TextStyle(fontSize: 24)),
//     );
//   }
// }
//
// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});
// //
// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }
// //
// // class _HomeScreenState extends State<HomeScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
// //
// //
// // class BrowseScreen extends StatefulWidget {
// //   const BrowseScreen({super.key});
// //
// //   @override
// //   State<BrowseScreen> createState() => _BrowseScreenState();
// // }
// //
// // class _BrowseScreenState extends State<BrowseScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
// //
// // class CartScreen extends StatefulWidget {
// //   const CartScreen({super.key});
// //
// //   @override
// //   State<CartScreen> createState() => _CartScreenState();
// // }
// //
// // class _CartScreenState extends State<CartScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
// //
// // class Customize extends StatefulWidget {
// //   const Customize({super.key});
// //
// //   @override
// //   State<Customize> createState() => _CustomizeState();
// // }
// //
// // class _CustomizeState extends State<Customize> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// //
// // // class MyHomePage extends StatefulWidget {
// // //   @override
// // //   _MyHomePageState createState() => _MyHomePageState();
// // // }
// // //
// // // class _MyHomePageState extends State<MyHomePage> {
// // //
// // //   final currentUser = FirebaseAuth.instance.currentUser!;
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         backgroundColor: Color(0xFFFFF1DE),
// // //         elevation: 0,
// // //         title: Container(
// // //           height: 40,
// // //           margin: EdgeInsets.symmetric(horizontal: 10),
// // //           decoration: BoxDecoration(
// // //             color: Colors.white,
// // //             borderRadius: BorderRadius.circular(25),
// // //           ),
// // //           padding: EdgeInsets.symmetric(horizontal: 10),
// // //           child: Row(
// // //             children: [
// // //               Icon(Icons.search, color: Colors.grey),
// // //               SizedBox(width: 10),
// // //               Expanded(
// // //                 child: TextField(
// // //                   decoration: InputDecoration(
// // //                     hintText: 'Search',
// // //                     border: InputBorder.none,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //         actions: [
// // //           // This is where the profile button was. It's now removed.
// // //         ],
// // //       ),
// // //       body: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.stretch,
// // //         children: [
// // //           SizedBox(height: 10), // Add space below the app bar
// // //           Container(
// // //             height: 150, // Give a fixed height to the horizontal list
// // //             padding: EdgeInsets.symmetric(horizontal: 20),
// // //             color: Color(0xFFFFF1DE),
// // //             child: ListView(
// // //               scrollDirection: Axis.horizontal,
// // //               children: [
// // //                 SizedBox(width: 30),
// // //                 CategoryItem(
// // //                   label: 'Ethnic',
// // //                   imageUrl:
// // //                   'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
// // //                 ),
// // //                 SizedBox(width: 30), // Increased spacing
// // //                 CategoryItem(
// // //                   label: 'Indian',
// // //                   imageUrl:
// // //                   'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
// // //                 ),
// // //                 SizedBox(width: 30), // Increased spacing
// // //                 CategoryItem(
// // //                   label: 'Casual',
// // //                   imageUrl:
// // //                   'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
// // //                 ),
// // //                 SizedBox(width: 30), // Increased spacing
// // //                 CategoryItem(
// // //                   label: 'Fusion',
// // //                   imageUrl:
// // //                   'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
// // //                 ),
// // //                 SizedBox(width: 30), // Increased spacing
// // //                 CategoryItem(
// // //                   label: 'Co-ord',
// // //                   imageUrl:
// // //                   'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
// // //                 ),
// // //                 SizedBox(width: 30), // Increased spacing
// // //                 CategoryItem(
// // //                   label: 'Lounge',
// // //                   imageUrl:
// // //                   'https://tse4.mm.bing.net/th?id=OIP.OUjcPEnuigGIyaS1EIiqxQHaLF&pid=Api&P=0&h=180',
// // //                 ),
// // //                 SizedBox(width: 30),
// // //               ],
// // //             ),
// // //           ),
// // //           SizedBox(height: 20),
// // //
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class CategoryItem extends StatefulWidget {
// // //   final String label;
// // //   final String imageUrl;
// // //
// // //   CategoryItem({required this.label, required this.imageUrl});
// // //
// // //   @override
// // //   _CategoryItemState createState() => _CategoryItemState();
// // // }
// // //
// // // class _CategoryItemState extends State<CategoryItem> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       margin: EdgeInsets.symmetric(horizontal: 6),
// // //       child: Column(
// // //         children: [
// // //           Container(
// // //             width: 70,
// // //             height: 100, // Adjusted height to avoid overflow
// // //             decoration: BoxDecoration(
// // //               color: Color(0xFFFBBD71),
// // //               borderRadius: BorderRadius.circular(10),
// // //               border: Border.all(
// // //                   color: Color(0xFFFBBD71),
// // //                   width: 5), // Thin border around the image
// // //             ),
// // //             child: ClipRRect(
// // //               borderRadius: BorderRadius.circular(10),
// // //               child: Image.network(
// // //                 widget.imageUrl,
// // //                 fit: BoxFit.cover,
// // //               ),
// // //             ),
// // //           ),
// // //           SizedBox(height: 5),
// // //           Text(
// // //             widget.label,
// // //             style: TextStyle(
// // //               fontSize: 12,
// // //               color: Colors.black,
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // //
