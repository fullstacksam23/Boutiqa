import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar and Profile Icon
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
            ],
          ),
          SizedBox(height: 24.0),
          // Designers of the Week Section
          Text(
            "Designers of the Week",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.0),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // Designer 1
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/5_avatar-128.png', // Replace with designer image URL
                        ),
                      ),
                      Text(
                        "Designer 1",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                // Designer 2
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/4_avatar-128.png', // Replace with designer image URL
                        ),
                      ),
                      Text(
                        "Designer 2",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                // Designer 3
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/10_avatar-512.png', // Replace with designer image URL
                        ),
                      ),

                      Text(
                        "Designer 3",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                // Designer 4
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/1_avatar-512.png', // Replace with designer image URL
                        ),
                      ),
                      Text(
                        "Designer 4",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                // Designer 5
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png', // Replace with designer image URL
                        ),
                      ),
                      Text(
                        "Designer 5",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          // Product Display Section
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  // Each box gets a different image URL
                  index == 0
                      ? 'https://idaho-o.com/wp-content/uploads/2023/12/image-59.png'
                      : index == 1
                      ? 'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/h/a/hand-embroidered-crepe-crop-top-set-in-peach-v1-tkb741.jpg'
                      : index == 2
                      ? 'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-jacquard-jodhpuri-suit-in-cream-v1-mhg3151.jpg'
                      : 'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-kurta-set-in-black-v1-mxx929.jpg',
                  fit: BoxFit.cover,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
//
// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange[50],
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text('BOUTIQA', style: TextStyle(color: Colors.black)),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 15.0),
//             child: CircleAvatar(
//               backgroundImage: AssetImage('assets/profile.jpg'), // Your profile image here
//             ),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 hintText: 'Search',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'LATEST FASHION',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       image: DecorationImage(
//                         image: AssetImage('assets/fashion1.jpg'), // First fashion image here
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Container(
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       image: DecorationImage(
//                         image: AssetImage('assets/fashion2.jpg'), // Second fashion image here
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 32),
//             Text(
//               'DESIGNERS OF THE WEEK',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 DesignerAvatar(imagePath: 'assets/designer1.jpg'),
//                 DesignerAvatar(imagePath: 'assets/designer2.jpg'),
//                 DesignerAvatar(imagePath: 'assets/designer3.jpg'),
//               ],
//             ),
//           ],
//         ),
//       ),
//
//     );
//   }
// }
//
// class DesignerAvatar extends StatelessWidget {
//   final String imagePath;
//
//   DesignerAvatar({required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: 40,
//       backgroundImage: AssetImage(imagePath),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// //
// // class Search extends StatefulWidget {
// //   const Search({Key? key}) : super(key: key);
// //
// //   @override
// //   _SearchState createState() => _SearchState();
// // }
// //
// // class _SearchState extends State<Search> {
// //   int _selectedIndex = 0;
// //
// //   static List<Widget> _widgetOptions = <Widget>[
// //     ListView(
// //       children: [
// //         CarouselSliderPage(),
// //       ],
// //     ),
// //     Center(child: Text('Search Page Content')),
// //     AddPage(),
// //     NotificationsPage(),
// //     ProfilePage(),
// //   ];
// //
// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         color: Color.fromARGB(255, 236, 182, 199), // Set your desired background color here
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: EdgeInsets.all(8.0),
// //               child: TextField(
// //                 decoration: InputDecoration(
// //                   hintText: 'Search...',
// //                   prefixIcon: Icon(Icons.search),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
// //                   ),
// //                   filled: true,
// //                   fillColor: Color.fromARGB(100, 100, 100, 100),
// //                 ),
// //               ),
// //             ),
// //             Expanded(
// //               child: _widgetOptions.elementAt(_selectedIndex),
// //             ),
// //           ],
// //         ),
// //       ),
// //
// //     );
// //   }
// // }
// //
// // class AddPage extends StatelessWidget {
// //   const AddPage({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Text('Add Page Content'),
// //     );
// //   }
// // }
// //
// // class NotificationsPage extends StatelessWidget {
// //   const NotificationsPage({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Text('Notifications Page Content'),
// //     );
// //   }
// // }
// //
// // class ProfilePage extends StatelessWidget {
// //   const ProfilePage({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Text('Profile Page Content'),
// //     );
// //   }
// // }
// //
// //
// // class CarouselSliderPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         CarouselSlider(
// //           items: [
// //             //1st Image of Slider
// //             Container(
// //               margin: EdgeInsets.all(3.0),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(8.0),
// //                 image: DecorationImage(
// //                   image: NetworkImage("https://stylesatlife.com/wp-content/uploads/2018/04/30-Latest-and-Best-Designer-Dresses-for-Women-in-Fashion.jpg"),
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //             //2nd Image of Slider
// //             Container(
// //               margin: EdgeInsets.all(6.0),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(8.0),
// //                 image: DecorationImage(
// //                   image: NetworkImage("https://www.topteny.com/wp-content/uploads/2017/05/Elie-Saab-collection-675x1015.jpg"),
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //             //3rd Image of Slider
// //             Container(
// //               margin: EdgeInsets.all(6.0),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(8.0),
// //                 image: DecorationImage(
// //                   image: NetworkImage("https://stylesatlife.com/wp-content/uploads/2018/04/30-Latest-and-Best-Designer-Dresses-for-Women-in-Fashion.jpg"),
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //             //4th Image of Slider
// //             Container(
// //               margin: EdgeInsets.all(6.0),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(8.0),
// //                 image: DecorationImage(
// //                   image: NetworkImage("https://stylesatlife.com/wp-content/uploads/2018/04/30-Latest-and-Best-Designer-Dresses-for-Women-in-Fashion.jpg"),
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //             //5th Image of Slider
// //             Container(
// //               margin: EdgeInsets.all(6.0),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(8.0),
// //                 image: DecorationImage(
// //                   image: NetworkImage("https://stylesatlife.com/wp-content/uploads/2018/04/30-Latest-and-Best-Designer-Dresses-for-Women-in-Fashion.jpg"),
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //           ],
// //           options: CarouselOptions(
// //             height: 250.0,
// //             enlargeCenterPage: false,
// //             aspectRatio: 4 / 3,
// //             enableInfiniteScroll: true,
// //             viewportFraction: 0.8,
// //             autoPlay: false,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }