import 'package:eclipse_code/settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyAccountPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B1113),
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black12,
                  child: Icon(Icons.person, size: 35, color: Colors.black87),
                ),
                SizedBox(width: 15),
                Text('User', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Divider(height: 1, color: Colors.grey[300]),
          buildOptionTile(context, 'Change Profile'),
          buildOptionTile(context, 'My Vouchers'),
          buildOptionTile(context, 'Liked Contents'),
          buildOptionTile(context, 'Watchlist'),
          buildOptionTile(context, 'Settings', targetPage: const SettingPage()),
        ],
      ),
    );
  }

  Widget buildOptionTile(
    BuildContext context,
    String title, {
    Widget? targetPage,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            if (targetPage != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => targetPage),
              );
            }
          },
        ),
        Divider(height: 1, color: Colors.grey[300]),
      ],
    );
  }
}
