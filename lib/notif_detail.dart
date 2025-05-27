import 'package:eclipse_code/ticket_details.dart';
import 'package:flutter/material.dart';

class NotificationDetailScreen extends StatelessWidget {
  final String title;
  final String time;
  final IconData icon;
  final Color iconBackgroundColor;

  const NotificationDetailScreen({
    super.key,
    required this.title,
    required this.time,
    required this.icon,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
// Your app's primary red

    final String fullMessage =
        "Thank you for your recent purchase! Your tickets for \"Nezha Reborn\" have been successfully secured. You can now access your tickets directly from your profile or by clicking the button below. Your transaction ID for this purchase is **#EC987654321**. Enjoy the movie!";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Notification Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF7B1113),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xFF7B1113), // Changed: Scaffold background color is now primaryRed
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Message Details Card
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, // Ensured: Message Details card background is white
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Message Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Color(0xFF7B1113), // Title text color remains primaryRed for contrast
                    ),
                  ),
                  const Divider(height: 20, thickness: 1, color: Colors.grey),
                  Text(
                    fullMessage,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black87, // Message body text remains dark for readability
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton.icon(
    onPressed: () {
      // Navigate to the TicketsPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TicketDetailPage()),
      );
    },
    icon: const Icon(Icons.confirmation_number, size: 20, color: Color(0xFF7B1113)),
    label: const Text(
      'View Your Tickets',
      style: TextStyle(fontSize: 16.0, color: Color(0xFF7B1113)),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 5,
    ),
  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      
    );
  }
}