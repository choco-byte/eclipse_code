
import 'package:flutter/material.dart';
//Halaman Settings
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF7B1113),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Language'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Placeholder untuk navigasi Language
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
          ListTile(
            title: const Text('Notification'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationSettingsPage(),
                ),
              );
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
        ],
      ),
    );
  }
}

//Halaman Notification Settings
class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _dealsNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Notification Settings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF7B1113),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Deals Notification'),
            subtitle: const Text(
              'Switch on updates on vouchers, promos, recoommendations and such.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            value: _dealsNotification,
            onChanged: (bool value) {
              setState(() {
                _dealsNotification = value;
              });
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
        ],
      ),
    );
  }
}
