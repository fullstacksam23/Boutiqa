import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> designers = [
    {"name": "Manish Malhotra", "image": "assets/new1.jpeg"},
    {"name": "Ritu Kumar", "image": "assets/new2.jpg"},
    {
      "name": "Sabyasachi Mukherjee",
      "image":
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.meNv2L040GZISp6ZUFXqXQHaE8%26pid%3DApi&f=1"
    },
    {
      "name": "Tarun Tahiliani",
      "image":
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.MJp3QKUIQkmwXPc9lU8mTAHaLH%26pid%3DApi&f=1"
    },
    {
      "name": "Payal Singhal",
      "image":
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.Wwkj6mz7ZUkF8pBMY7UvIwHaHa%26pid%3DApi&f=1"
    },
  ];
  List<Map<String, String>> filteredDesigners = [];

  @override
  void initState() {
    super.initState();
    filteredDesigners = designers;
    _searchController.addListener(() {
      setState(() {
        filteredDesigners = designers
            .where((designer) => designer['name']!
            .toLowerCase()
            .contains(_searchController.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
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
                children: filteredDesigners.map((designer) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(designer: designer),
                        ),
                      );
                    },
                    child: _designerTile(designer['name']!, designer['image']!,
                        isNetwork: designer['image']!.startsWith("http")),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 24.0),
            // Product Display Section
            Text(
              "Our Collections",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.0),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(6, (index) {
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
                        : index == 3
                        ? 'https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-kurta-set-in-black-v1-mxx929.jpg'
                        : index == 4
                        ? 'https://www.houseofdesigners.in/cdn/shop/files/ORIGANI_HA_24_06JK_Maroon_Harmony_Embroidered_Jacket_1.jpg?v=1732017696&width=360'
                        : 'https://www.anitadongre.com/on/demandware.static/-/Sites-AD-INDIA-Library/default/dwdc3371fd/images/Home%20page/Oct%202024/23_Oct_2024/01_Mens_Web.jpg',
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _designerTile(String name, String imagePath,
      {bool isNetwork = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: isNetwork
                ? NetworkImage(imagePath)
                : AssetImage(imagePath) as ImageProvider,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final Map<String, String> designer;

  ProfilePage({required this.designer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(designer['name']!),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: designer['image']!.startsWith("http")
                  ? NetworkImage(designer['image']!)
                  : AssetImage(designer['image']!) as ImageProvider,
            ),
            SizedBox(height: 20),
            Text(
              designer['name']!,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "${designer['name']} is one of the renowned fashion designers in India. Over the years, the label's aesthetic has aimed to bring together traditional Indian craftsmanship with contemporary silhouettes like gowns with intricate gold embroidery, cigarette pants paired with long jackets for women, voluminous lehengas worn with cropped blouses, or the use of non-traditional colors like royal blue, soft pink, maroon, etc., in bridal ensembles. The label's design language is claimed to exhibit glamour and is a reflection of modern India.",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}