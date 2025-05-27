import 'package:flutter/material.dart';
import 'package:eclipse_code/components/notif_item.dart'; 
import 'package:eclipse_code/notif_detail.dart';
import 'package:eclipse_code/components/notif_data.dart'; 

void main() {
  runApp(MaterialApp(
    home: NotificationPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Notifications',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xFF7B1113),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                labelColor: Color(0xFF7B1113),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0xFF7B1113),
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: 'For You'),
                  Tab(text: 'Inbox'),
                ],
              ),
              
            ),
            Divider(height: 0, color: Colors.white,),
            Expanded(
              child: TabBarView(
                children: [
                  Foryou(),
                  Inbox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================================
// Foryou Tab Content - Remains StatelessWidget
// =====================================================================
class Foryou extends StatelessWidget {
  const Foryou({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: const Color(0xFFFDE7E7),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.notifications,
                  color: Color(0xFFE11F22),
                  size: 26.0,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Information!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        'Please note that there might be a brief delay in securing your seats at the theater while processing your ticket purchase.',
                        style: TextStyle(fontSize: 13.0, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6.0),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Today',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 8.0),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            children: const [
              // No onTap needed for Foryou notifications in this example
              NotificationItem(
                icon: Icons.percent,
                title:
                    '50% Off Extravaganza: Grab Your Movie Ticket at Half Price!',
                time: '10.00 AM',
                iconBackgroundColor: Color(0xFF212121),
              ),

              NotificationItem(
                icon: Icons.movie,
                title:
                    'New movie alert! "Godzilla x Kong: The New Empire" is now playing!', // Corrected title from previous code
                time: '9.00 AM',
                iconBackgroundColor: Color(0xFF212121),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Yesterday',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
              ),

              NotificationItem(
                icon: Icons.local_activity,
                title:
                    'Exclusive offer just for you! Get 15% off popcorn combos this week.', // Corrected title from previous code
                time: '7.00 AM',
                iconBackgroundColor: Color(0xFF212121),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// =====================================================================
// Inbox Tab Content - NOW A StatefulWidget to manage read status
// =====================================================================
class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  // This list holds your notifications and their read status
  List<NotificationData> _notifications = [
    NotificationData(
      id: 'payment_1', // Unique ID
      icon: Icons.check_circle_outline,
      title: 'Payment successful! Your tickets for "Nezha Reborn" are secured.',
      time: '5 minutes ago',
      iconBackgroundColor: Colors.green,
      isRead: false, // This notification starts as unread
    ),
    NotificationData(
      id: 'booking_2',
      icon: Icons.confirmation_number,
      title:
          'Your booking for "Spider-Man: Across the Spider-Verse" is confirmed!',
      time: '1 day ago',
      iconBackgroundColor: Colors.blue,
      isRead: false, // This notification starts as unread
    ),
    // Add more notifications here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Text(
            'Today',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10.0),

        Expanded(
          child: ListView.builder(
            // Using ListView.builder for efficient list rendering
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            itemCount: _notifications.length,
            itemBuilder: (context, index) {
              final notification =
                  _notifications[index]; // Get the current notification data

              return NotificationItem(
                icon: notification.icon,
                title: notification.title,
                time: notification.time,
                iconBackgroundColor: notification.iconBackgroundColor,
                isRead:
                    notification
                        .isRead, // Pass the current read status to NotificationItem
                onTap: () {
                  // Mark the notification as read when it's tapped
                  setState(() {
                    _notifications[index] = notification.copyWith(isRead: true);
                  });

                  // Navigate to the detail screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => NotificationDetailScreen(
                            title: notification.title,
                            time: notification.time,
                            icon: notification.icon,
                            iconBackgroundColor:
                                notification.iconBackgroundColor,
                          ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
