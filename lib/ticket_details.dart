import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';


class TicketDetailPage extends StatelessWidget {
  const TicketDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ticket Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF7B1113),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      backgroundColor: const Color(0xFF7B1113),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Container(
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/nezha2.jpg',
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Text(
                            '● ● ● ● ● ● ● ● ● ● ●',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        const Text(
                          'Ne Zha 2',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    TicketInfo(
                                      label: 'Location',
                                      value: 'Eclipse Cinema',
                                    ),
                                    SizedBox(height: 20),
                                    TicketInfo(label: 'Time', value: '7:15 PM'),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 1,
                                color: Colors.grey,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      TicketInfo(
                                        label: 'Date',
                                        value: '23th May 2025',
                                      ),
                                      SizedBox(height: 20),
                                      TicketInfo(label: 'Seat', value: 'C9'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        BarcodeWidget(
                          data: 'NEZHA2-23MAY2025-C9',
                          barcode: Barcode.code128(),
                          width: 220,
                          height: 70,
                          drawText: false,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    Positioned(
                      left: -20,
                      top: 310,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF7B1113),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -20,
                      top: 310,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF7B1113),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TicketInfo extends StatelessWidget {
  final String label;
  final String value;

  const TicketInfo({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
