import 'package:flutter/material.dart';

class UpdateProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using Stack for full-screen gradient effect
      body: Center(
        child: Stack(
          children: [
            // Full-screen Gradient background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 217, 182, 128),
                    Color.fromARGB(255, 238, 236, 234)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            // Main content on top of the gradient
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Picture with Edit Icon
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.brown.shade100,
                            child: ClipOval(
                              child: Image.network(
                                'https://thumbs.dreamstime.com/z/female-avatar-profile-picture-vector-female-avatar-profile-picture-vector-102690279.jpg?w=768', // Replace with actual image URL
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Input Fields with "Update" Button
                    InputFieldWithUpdate(label: 'Name'),
                    SizedBox(height: 15),
                    InputFieldWithUpdate(label: 'Mobile'),
                    SizedBox(height: 15),
                    InputFieldWithUpdate(label: 'Email'),
                    SizedBox(height: 15),
                    InputFieldWithUpdate(label: 'Date of Birth'),
                    SizedBox(height: 15),
                    InputFieldWithUpdate(label: 'Gender'),

                    SizedBox(height: 30),

                    // Update Profile Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Add update profile logic here
                        },
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white), // Text color changed to white
                        ),
                        style: ElevatedButton.styleFrom(
                          padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                          backgroundColor: Colors.brown,
                          elevation: 8, // Elevation for shadow effect
                          shadowColor: Colors.brown.shade300, // Shadow color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputFieldWithUpdate extends StatelessWidget {
  final String label;

  const InputFieldWithUpdate({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Input Field with Shadow
        Expanded(
          child: Container(
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
                labelText: label,
                labelStyle: TextStyle(color: Colors.brown.shade700),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),

        // "Update" Button with Shadow
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.brown.shade200, // Shadow color
                blurRadius: 6, // How blurred the shadow is
                offset: Offset(0, 3), // Offset of the shadow
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              // Add update action for the specific field
              print('Update $label');
            },
            child: Text(
              'Update',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white), // Text color changed to white
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              backgroundColor: Colors.brown,
              elevation: 0, // Remove native button elevation for custom shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}