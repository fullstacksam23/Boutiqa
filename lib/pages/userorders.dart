import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: OrderHistoryPage(),
    );
  }
}

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
      'designedBy': 'John Doe',
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
      'designedBy': 'Jane Smith',
      'quantity': '2',
      'showDetails': false,
    },
    // Add other orders...
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

  void _reorder(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Reordered: $title'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F3EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F3EE),
        elevation: 0,
        title: null,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    designedBy: order['designedBy']!,
                    quantity: order['quantity']!,
                    showDetails: order['showDetails'] ?? false,
                    onTap: () => _toggleOrderDetails(index),
                    onReorder: () => _reorder(order['title']!),
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
  final String designedBy;
  final String quantity;
  final bool showDetails;
  final VoidCallback onTap;
  final VoidCallback onReorder;

  const OrderCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
    required this.date,
    required this.designedBy,
    required this.quantity,
    required this.showDetails,
    required this.onTap,
    required this.onReorder,
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
            'Designed By: $designedBy',
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
          ElevatedButton(
            onPressed: onReorder,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Reorder'),
          ),
        ],
      ],
    );
  }
}