import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      'title': 'Bridal wear',
      'imageUrl':
      'https://images.squarespace-cdn.com/content/v1/55353879e4b0995b98f4fede/1603212572697-ACWQAKDKZWHKDGDM8S5O/falguni?format=1500w',
      'price': '₹2000',
      'buttonText': 'Order Status',
    },
    {
      'title': 'Modern Suit',
      'imageUrl':
      'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-suede-tuxedo-set-in-dark-green-v1-mxd76.jpg',
      'price': '₹3000',
      'buttonText': 'Reorder',
    },
    {
      'title': 'Classic Jacket',
      'imageUrl':
      'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-chanderi-silk-long-jacket-in-dark-green-v1-mxx1050.jpg',
      'price': '₹1800',
      'buttonText': 'Reorder',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F3EE), // Light beige background
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F3EE),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.brown,
          ),
          onPressed: () {
            // Add back navigation logic here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order History Title
            Text(
              'Order history',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 53, 15, 1),
              ),
            ),
            SizedBox(height: 20),

            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.shade200,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  icon: Icon(Icons.search,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Recent Order Title
            Text(
              'Recent Order',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 39, 11, 0),
              ),
            ),
            SizedBox(height: 10),

            // Order List
            Expanded(
              child: ListView.separated(
                itemCount: orders.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.brown.shade200,
                  thickness: 1,
                  height: 30,
                ),
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return OrderCard(
                    imageUrl: order['imageUrl']!,
                    title: order['title']!,
                    price: order['price']!,
                    buttonText: order['buttonText']!,
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
  final String buttonText;

  const OrderCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    // Image
    ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Image.network(
    imageUrl,
    width: 100,
    height: 100,
    fit: BoxFit.cover,
    ),
    ),
    SizedBox(width: 15),

    // Details
    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    title,
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 0, 0, 0),
    ),
    ),
    SizedBox(height: 5),
    Text(
    price,
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 0, 0, 0),
    ),
    ),
    ],
    ),
    ),

    // Gradient Button
    Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Colors.grey.shade600, Colors.grey.shade400],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(20),
    ),
    child: ElevatedButton(
    onPressed: () {
    // Add button action here
    },
    style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    backgroundColor: Colors.transparent,
    shadowColor: Colors.brown.shade300,
    side: BorderSide(color: Colors.grey.shade200),
    elevation: 5,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    ),
    ),
    child: Text(
    buttonText,
    style: TextStyle(fontSize: 12, color: Colors.black),
    ),
    ),
    ),
    ],
    );
    }
}




// import "package:flutter/material.dart";
//
// class UserOrdersScreen extends StatefulWidget {
//   @override
//   _UserOrdersScreenState createState() => _UserOrdersScreenState();
// }
//
// class _UserOrdersScreenState extends State<UserOrdersScreen> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 100, // Increase the height of the AppBar
//           centerTitle: true,
//           title: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 20), // Add space above the text
//               Text(
//                 'order history',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.network(
//                 'https://media.istockphoto.com/id/912065854/vector/sketh.jpg?s=612x612&w=0&k=20&c=Eg1h1ek5SMbzT-nfZ_8mcBhC5aqzWd6X1DmcE1W5Rv8=', // Replace with your network image URL
//                 height: 150,
//               ),
//               SizedBox(width: 16),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'customer: Helena',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'date: 08 June 2024',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'price: 2750 rupees',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//             backgroundColor: Colors.black, // Change the background color here
//             selectedItemColor: Colors.black, // Change the color of selected item
//             unselectedItemColor:
//             Colors.black, // Change the color of unselected items
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.add_box),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.notifications),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: '',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             onTap: _onItemTapped,
//             ),
//         );
//     }
// }