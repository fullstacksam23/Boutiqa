import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Chat> chats = [
    Chat(
      name: 'John Doe',
      message: 'Hey, how are you?',
      time: '10:30 AM',
      avatarUrl: 'https://via.placeholder.com/150',
    ),
    Chat(
      name: 'Jane Smith',
      message: 'Let\'s catch up later!',
      time: '9:15 AM',
      avatarUrl: 'https://via.placeholder.com/150',
    ),
    // Add more chat data here
  ];

  List<Chat> filteredChats = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredChats = chats;
    searchController.addListener(() {
      filterChats();
    });
  }

  void filterChats() {
    List<Chat> results = [];
    if (searchController.text.isEmpty) {
      results = chats;
    } else {
      results = chats
          .where((chat) => chat.name
          .toLowerCase()
          .contains(searchController.text.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredChats = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 233, 233),
        elevation: 10,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Color.fromARGB(0, 0, 0, 0)),
            onPressed: () {},
          ),
        ],
        title: Center(
          child: Padding(
            padding:
            EdgeInsets.only(right: 56.0), // Padding to center the title
            child: Text(
              'Chats',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredChats.length,
        itemBuilder: (context, index) {
          return ChatItem(chat: filteredChats[index]);
        },
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final Chat chat;

  const ChatItem({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chat.avatarUrl),
      ),
      title: Text(chat.name),
      subtitle: Text(chat.message),
      trailing: Text(chat.time),
      onTap: () {
        // Handle chat item tap
      },
    );
  }
}

class Chat {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  Chat({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
  });
}