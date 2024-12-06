import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final List<Map<String, dynamic>> orders = [
    {
      'title': 'Bridal wear',
      'imageUrl':
      'https://images.squarespace-cdn.com/content/v1/55353879e4b0995b98f4fede/1603212572697-ACWQAKDKZWHKDGDM8S5O/falguni?format=1500w',
      'price': '₹2000',
      'description': 'Elegant bridal wear for a perfect wedding.',
      'date': '2023-10-12',
      'orderedBy': 'John Doe',
      'quantity': '1',
      'showDetails': false,
    },
    {
      'title': 'Modern Suit',
      'imageUrl':
      'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-suede-tuxedo-set-in-dark-green-v1-mxd76.jpg',
      'price': '₹3000',
      'description': 'A modern, stylish suit for any formal occasion.',
      'date': '2023-11-20',
      'orderedBy': 'Jane Smith',
      'quantity': '2',
      'showDetails': false,
    },
    {
      'title': 'Classic Jacket',
      'imageUrl':
      'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-chanderi-silk-long-jacket-in-dark-green-v1-mxx1050.jpg',
      'price': '₹1800',
      'description': 'A classic jacket that blends tradition and fashion.',
      'date': '2023-08-15',
      'orderedBy': 'Alex Brown',
      'quantity': '1',
      'showDetails': false,
    },
    {
      'title': 'Black Leather Jacket',
      'imageUrl':
      'https://www.urbanfashionstudio.com/wp-content/uploads/2020/06/229.jpg',
      'price': '₹2500',
      'description': 'Stylish black leather jacket for modern fashion.',
      'date': '2023-12-01',
      'orderedBy': 'Sarah Green',
      'quantity': '1',
      'showDetails': false,
    },
    {
      'title': 'Casual Denim Shirt',
      'imageUrl':
      'https://i.pinimg.com/originals/86/52/3e/86523e87499e89f11201acaca79abd60.jpg',
      'price': '₹1200',
      'description': 'Comfortable casual denim shirt for daily wear.',
      'date': '2023-12-02',
      'orderedBy': 'David Williams',
      'quantity': '2',
      'showDetails': false,
    },
    {
      'title': 'Wedding Saree',
      'imageUrl':
      'https://i.pinimg.com/originals/50/2a/14/502a14c20f6453f6d4cb034f913c9aae.jpg',
      'price': '₹5000',
      'description': 'A traditional wedding saree with intricate designs.',
      'date': '2023-11-25',
      'orderedBy': 'Priya Patel',
      'quantity': '1',
      'showDetails': false,
    },
    {
      'title': 'Tuxedo Suit',
      'imageUrl':
      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.tom-murphy.ie%2Fwp-content%2Fuploads%2F2017%2F01%2FWCC17_TITEL_079_ANSATZ.jpg&f=1&nofb=1&ipt=89f7466952ba55a6ba441e08307f719ca781ae46e6e767351b2ff025710ed3e2&ipo=images',
      'price': '₹3500',
      'description': 'A well-fitted tuxedo for formal events and parties.',
      'date': '2023-10-10',
      'orderedBy': 'Ravi Kumar',
      'quantity': '1',
      'showDetails': false,
    },
    {
      'title': 'Summer Dress',
      'imageUrl':
      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.sydnestyle.com%2Fwp-content%2Fuploads%2F2018%2F05%2FSydne-Style-shares-dresses-for-summer-vacation-in-lulus-white-midi-dress.jpg&f=1&nofb=1&ipt=fb30c6e7ca12ac18d74ae1a0c53148d3b0f56fc547cea0324d5d27cc3d71014b&ipo=images',
      'price': '₹1800',
      'description': 'Light and airy summer dress for warm days.',
      'date': '2023-09-05',
      'orderedBy': 'Emma Lee',
      'quantity': '2',
      'showDetails': false,
    },
  ];

  List<Map<String, dynamic>> filteredOrders = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredOrders = orders;
    _searchController.addListener(_filterOrders);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterOrders);
    _searchController.dispose();
    super.dispose();
  }

  void _filterOrders() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredOrders = orders.where((order) {
        return order['title']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _toggleOrderDetails(int index) {
    setState(() {
      filteredOrders[index]['showDetails'] =
      !(filteredOrders[index]['showDetails'] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE3D8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18,),
            const Text(
              'Order history',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 53, 15, 1),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.shade200,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Order',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 39, 11, 0),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: filteredOrders.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.brown.shade200,
                  thickness: 1,
                  height: 30,
                ),
                itemBuilder: (context, index) {
                  final order = filteredOrders[index];
                  return OrderCard(
                    imageUrl: order['imageUrl']!,
                    title: order['title']!,
                    price: order['price']!,
                    description: order['description']!,
                    date: order['date']!,
                    orderedBy: order['orderedBy']!,
                    quantity: order['quantity']!,
                    showDetails: order['showDetails'] ?? false,
                    onTap: () => _toggleOrderDetails(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String description;
  final String date;
  final String orderedBy;
  final String quantity;
  final bool showDetails;
  final VoidCallback onTap;

  const OrderCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
    required this.date,
    required this.orderedBy,
    required this.quantity,
    required this.showDetails,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: onTap,
              ),
            ],
          ),
        ),
        if (showDetails) ...[
          const SizedBox(height: 10),
          Text(
            'Order Date: $date',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Ordered By: $orderedBy',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Quantity Ordered: $quantity',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ],
    );
  }
}

// import 'package:flutter/material.dart';
//
// class OrderHistoryPage extends StatelessWidget {
//   final List<Map<String, String>> orders = [
//     {
//       'title': 'Bridal wear',
//       'imageUrl':
//       'https://images.squarespace-cdn.com/content/v1/55353879e4b0995b98f4fede/1603212572697-ACWQAKDKZWHKDGDM8S5O/falguni?format=1500w',
//       'price': '₹2000',
//       'buttonText': 'Order Status',
//     },
//     {
//       'title': 'Modern Suit',
//       'imageUrl':
//       'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-suede-tuxedo-set-in-dark-green-v1-mxd76.jpg',
//       'price': '₹3000',
//       'buttonText': 'Reorder',
//     },
//     {
//       'title': 'Classic Jacket',
//       'imageUrl':
//       'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-chanderi-silk-long-jacket-in-dark-green-v1-mxx1050.jpg',
//       'price': '₹1800',
//       'buttonText': 'Reorder',
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF9F3EE), // Light beige background
//       appBar: AppBar(
//         backgroundColor: Color(0xFFF9F3EE),
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.brown,
//           ),
//           onPressed: () {
//             // Add back navigation logic here
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Order History Title
//             Text(
//               'Order history',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: const Color.fromARGB(255, 53, 15, 1),
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Search Bar
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.brown.shade200,
//                     blurRadius: 6,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   border: InputBorder.none,
//                   icon: Icon(Icons.search,
//                       color: const Color.fromARGB(255, 0, 0, 0)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Recent Order Title
//             Text(
//               'Recent Order',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: const Color.fromARGB(255, 39, 11, 0),
//               ),
//             ),
//             SizedBox(height: 10),
//
//             // Order List
//             Expanded(
//               child: ListView.separated(
//                 itemCount: orders.length,
//                 separatorBuilder: (context, index) => Divider(
//                   color: Colors.brown.shade200,
//                   thickness: 1,
//                   height: 30,
//                 ),
//                 itemBuilder: (context, index) {
//                   final order = orders[index];
//                   return OrderCard(
//                     imageUrl: order['imageUrl']!,
//                     title: order['title']!,
//                     price: order['price']!,
//                     buttonText: order['buttonText']!,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class OrderCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String price;
//   final String buttonText;
//
//   const OrderCard({
//     required this.imageUrl,
//     required this.title,
//     required this.price,
//     required this.buttonText,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//     // Image
//     ClipRRect(
//     borderRadius: BorderRadius.circular(15),
//     child: Image.network(
//     imageUrl,
//     width: 100,
//     height: 100,
//     fit: BoxFit.cover,
//     ),
//     ),
//     SizedBox(width: 15),
//
//     // Details
//     Expanded(
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(
//     title,
//     style: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.bold,
//     color: Color.fromARGB(255, 0, 0, 0),
//     ),
//     ),
//     SizedBox(height: 5),
//     Text(
//     price,
//     style: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.bold,
//     color: Color.fromARGB(255, 0, 0, 0),
//     ),
//     ),
//     ],
//     ),
//     ),
//
//     // Gradient Button
//     Container(
//     decoration: BoxDecoration(
//     gradient: LinearGradient(
//     colors: [Colors.grey.shade600, Colors.grey.shade400],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     ),
//     borderRadius: BorderRadius.circular(20),
//     ),
//     child: ElevatedButton(
//     onPressed: () {
//     // Add button action here
//     },
//     style: ElevatedButton.styleFrom(
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//     backgroundColor: Colors.transparent,
//     shadowColor: Colors.brown.shade300,
//     side: BorderSide(color: Colors.grey.shade200),
//     elevation: 5,
//     shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(20),
//     ),
//     ),
//     child: Text(
//     buttonText,
//     style: TextStyle(fontSize: 12, color: Colors.black),
//     ),
//     ),
//     ),
//     ],
//     );
//     }
// }
//
//
//
//
// // import "package:flutter/material.dart";
// //
// // class UserOrdersScreen extends StatefulWidget {
// //   @override
// //   _UserOrdersScreenState createState() => _UserOrdersScreenState();
// // }
// //
// // class _UserOrdersScreenState extends State<UserOrdersScreen> {
// //   int _selectedIndex = 0;
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
// //         appBar: AppBar(
// //           toolbarHeight: 100, // Increase the height of the AppBar
// //           centerTitle: true,
// //           title: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               SizedBox(height: 20), // Add space above the text
// //               Text(
// //                 'order history',
// //                 style: TextStyle(
// //                   fontSize: 24,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         body: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Row(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Image.network(
// //                 'https://media.istockphoto.com/id/912065854/vector/sketh.jpg?s=612x612&w=0&k=20&c=Eg1h1ek5SMbzT-nfZ_8mcBhC5aqzWd6X1DmcE1W5Rv8=', // Replace with your network image URL
// //                 height: 150,
// //               ),
// //               SizedBox(width: 16),
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     'customer: Helena',
// //                     style: TextStyle(fontSize: 18),
// //                   ),
// //                   SizedBox(height: 8),
// //                   Text(
// //                     'date: 08 June 2024',
// //                     style: TextStyle(fontSize: 18),
// //                   ),
// //                   SizedBox(height: 8),
// //                   Text(
// //                     'price: 2750 rupees',
// //                     style: TextStyle(fontSize: 18),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //         bottomNavigationBar: BottomNavigationBar(
// //             backgroundColor: Colors.black, // Change the background color here
// //             selectedItemColor: Colors.black, // Change the color of selected item
// //             unselectedItemColor:
// //             Colors.black, // Change the color of unselected items
// //             items: const <BottomNavigationBarItem>[
// //               BottomNavigationBarItem(
// //                 icon: Icon(Icons.home),
// //                 label: '',
// //               ),
// //               BottomNavigationBarItem(
// //                 icon: Icon(Icons.search),
// //                 label: '',
// //               ),
// //               BottomNavigationBarItem(
// //                 icon: Icon(Icons.add_box),
// //                 label: '',
// //               ),
// //               BottomNavigationBarItem(
// //                 icon: Icon(Icons.notifications),
// //                 label: '',
// //               ),
// //               BottomNavigationBarItem(
// //                 icon: Icon(Icons.person),
// //                 label: '',
// //               ),
// //             ],
// //             currentIndex: _selectedIndex,
// //             onTap: _onItemTapped,
// //             ),
// //         );
// //     }
// // }