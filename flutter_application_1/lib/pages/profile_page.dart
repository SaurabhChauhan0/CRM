import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String profileImage;
  final String name;
  final String email;
  final int phone;
  final String address;
  final String role;
  final String password;
  final List<String> skills;

  UserProfilePage(
      {required this.profileImage,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.role,
      required this.password,
      required this.skills});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // Handle cross button press
              // You can navigate to a different screen or perform any other action here
              Navigator.pop(context);
            },
          ),
        ],
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('asset/images/dummy.png'),
              ),
            ),
            const SizedBox(height: 20),
            Center(
                child: Text(role,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic))),
            const SizedBox(height: 24.0),
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Full Name"),
              subtitle: Text("$name"),
            ),
            ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text('Email'),
              subtitle: Text(email),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text("$phone"),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Address'),
              subtitle: Text(address),
            ),
            ListTile(
              leading: Icon(Icons.password),
              title: Text('Password'),
              subtitle: Text(password),
            ),
            SizedBox(height: 24.0),
            const Text(
              'Skills',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Wrap(
              spacing: 8.0,
              children: [
                Chip(label: Text(skills[0])),
                Chip(label: Text(skills[1])),
                Chip(label: Text(skills[2])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
