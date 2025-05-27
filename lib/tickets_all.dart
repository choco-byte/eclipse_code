import 'package:eclipse_code/ticket_details.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tickets',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF7B1113),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: Color(0xFF7B1113),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0xFF7B1113),
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: [Tab(text: 'All Tickets'), Tab(text: 'Completed')],
              ),
            ),
            const Divider(height: 0, color: Colors.white),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      TicketCard(
                        movieTitle: 'Ne Zha 2',
                        date: 'Sunday, 25th May 2025',
                        time: '7:15 PM',
                        studio: '1',
                        seat: 'C9',
                        barcodeData: 'NEZHA2-25MAY2025-C9',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TicketDetailPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  // Completed tab
                  const Center(child: Text('No completed tickets')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  final String movieTitle, date, time, studio, seat, barcodeData;
  final VoidCallback onTap;

  const TicketCard({
    super.key,
    required this.movieTitle,
    required this.date,
    required this.time,
    required this.studio,
    required this.seat,
    required this.barcodeData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 20),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF7B1113),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: const Text(
                "Eclipse Cinema",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Poster
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/nezha2.jpg',
                      width: 80,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Ticket Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieTitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(date),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Time",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(time),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Studio",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(studio),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Seat",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(seat),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 2,
                        right: 30,
                        top: 36,
                      ), // tambahkan right agar makin ke kanan
                      child: Transform.rotate(
                        angle: -1.5708,
                        child: BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: barcodeData,
                          width: 120,
                          height: 40,
                          drawText: false,
                          backgroundColor: Colors.white,
                        ),
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
