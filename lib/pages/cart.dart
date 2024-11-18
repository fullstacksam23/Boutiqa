import 'package:flutter/material.dart';
import 'package:boutiqa/pages/bag.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _currentIndex = 2; // Keep the bottom navigation selected on "Cart"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            // Stylish Top Section
            Stack(
              children: [
                // Gradient Background
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.brown.shade700,
                        Colors.brown.shade400,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                // "Bag" Button
                Positioned(
                  top: 40,
                  right: 20, // Position it on the top-right
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BagPage()),);
                    },
                    icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
                    label: Text("Bag", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                // Title
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    "Cart/Wishlist",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // Main Body: Display a grid of items
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: List.generate(4, (index) {
                    String productImageUrl;
                    String productName;
                    String productPrice;

                    // Customizing content for each product
                    if (index == 0) {
                      productImageUrl =
                      'https://idaho-o.com/wp-content/uploads/2023/12/image-65.png'; // Change with your image
                      productName = "casual kurti set";
                      productPrice = "₹5000";
                    } else if (index == 1) {
                      productImageUrl =
                      'https://images.squarespace-cdn.com/content/v1/55353879e4b0995b98f4fede/1603213226108-D4T2PLQJW08K27IV421S/Ritu?format=1500w'; // Change with your image
                      productName = "Bridal lehenga";
                      productPrice = "₹70000";
                    } else if (index == 2) {
                      productImageUrl =
                      'https://www.aachho.com/cdn/shop/products/83_88ed1ec8-ee01-483e-bde5-706d0bb3ff70_360x.jpg?v=1684744830'; // Change with your image
                      productName = "co ord set";
                      productPrice = "₹3000";
                    } else {
                      productImageUrl =
                      'https://mrbutton.in/cdn/shop/files/1_fd2afa94-1d6a-4ef0-8f8e-e6c91e717784.jpg?v=1698478943&width=900'; // Change with your image
                      productName = "Blazer for men";
                      productPrice = "₹2000";
                    }

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              productImageUrl,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(productName, style: TextStyle(fontSize: 16)),
                          Text(productPrice,
                              style:
                              TextStyle(fontSize: 14, color: Colors.black54)),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor:
                              Colors.white, // Text color inside the button
                            ),
                            child: Text("Add to Bag"),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
        );
    }
}