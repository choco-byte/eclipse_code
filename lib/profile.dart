import 'package:eclipse_code/login.dart';
import 'package:eclipse_code/rating_app.dart';
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
          buildOptionTile(context, 'My Movies'),
          buildOptionTile(context, 'Settings', targetPage: const SettingPage()),
           buildOptionTile(
            context,
            'Rate Us',
            // Kita sekarang menyediakan callback onTap kustom
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false, // Dialog tidak bisa ditutup dengan tap di luar area dialog
                builder: (BuildContext dialogContext) {
                  return const RatingPopup(); // Menampilkan RatingPopup sebagai dialog
                },
              );
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                onPressed: () => _showLogoutConfirmation(context),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOptionTile(
    BuildContext context,
    String title, {
    Widget? targetPage,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap ?? () {
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

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog

              // Replace all routes with LoginScreen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
