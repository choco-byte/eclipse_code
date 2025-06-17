import 'package:eclipse_code/seat_selection.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MovieDetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  bool _showSynopsis = true; // State to toggle between synopsis and schedule

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF7B1113),
        title: Text("Movie Details", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/nezha.png',
                  width: double.infinity,
                  height: 250,
                  fit:
                      BoxFit
                          .cover, // Changed fit to cover for better image display
                ),
                
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/nezha_poster.jpeg',
                    width: 80,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        InfoRow(label: 'Genre', value: 'Fantasy, Animation'),
                        InfoRow(label: 'Duration', value: '2 hours 25 minutes'),
                        InfoRow(label: 'Director', value: 'Jiaozi (Yang Yu)'),
                        InfoRow(label: 'Age Rating', value: 'SU'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const RatingSection(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showSynopsis = true;
                      });
                    },
                    child: Text(
                      'SYNOPSIS',
                      style: TextStyle(
                        fontWeight:
                            _showSynopsis ? FontWeight.bold : FontWeight.normal,
                        fontSize: 16,
                        color: _showSynopsis ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showSynopsis = false;
                      });
                    },
                    child: Text(
                      'SCHEDULE',
                      style: TextStyle(
                        fontWeight:
                            !_showSynopsis
                                ? FontWeight.bold
                                : FontWeight.normal,
                        fontSize: 16,
                        color: !_showSynopsis ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 20, thickness: 1),
            _showSynopsis ? const SynopsisContent() : const ScheduleContent(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class CastCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String role;

  const CastCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 30),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
          Text(
            role,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        '9.9',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'RATING',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Text(
                        '710 Votes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_right, size: 20),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Row(
                children: [
                  Icon(Icons.favorite_border, color: Colors.black),
                  SizedBox(width: 6),
                  Text(
                    'Add to watchlist',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Text(
                '5,645 People',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SynopsisContent extends StatelessWidget {
  const SynopsisContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Ne Zha and Ao Bing find themselves in an unimaginable fate after surviving a cataclysmic bolt of heavenly lightning. Their physical bodies are destroyed, but Taiyi Zhenren, determined to preserve their spirits, exhausts his Sacred Lotus to reconstruct their mortal forms.",
            style: TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Cast',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              CastCard(
                imagePath: 'assets/yangyu.png',
                name: 'Yang Yu',
                role: 'Director',
              ),
              CastCard(
                imagePath: 'assets/hanmo.png',
                name: 'Han Mo',
                role: 'Ao Bing (Voice)',
              ),
              CastCard(
                imagePath: 'assets/liyanting.png',
                name: 'Li Yanting',
                role: 'Young Nezha (voice)',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ScheduleContent extends StatelessWidget {
  const ScheduleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDateButton('25 Mar', 'TODAY', true),
              _buildDateButton('25 Mar', 'WED', false),
              _buildDateButton('25 Mar', 'THU', false),
              _buildDateButton('25 Mar', 'FRI', false),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Studio 1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'VIP 2D',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        _buildTimeSlotButton('12.00', () {
                          print('Selected time: 12.00');
                        }),
                        _buildTimeSlotButton('15.00', () {
                          print('Selected time: 15.00');
                        }),
                        _buildTimeSlotButton('19.15', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CinemaSeatApp(),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const Text(
                    '50.000',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Studio 2',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'Regular 2D',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        _buildTimeSlotButton('12.00', () {
                          print('Selected time: 12.00');
                        }),
                        _buildTimeSlotButton('15.00', () {
                          print('Selected time: 15.00');
                        }),
                        _buildTimeSlotButton('19.15', () {
                          print('Selected time: 19.15');
                        }),
                      ],
                    ),
                  ),
                  const Text(
                    '40.000',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateButton(String date, String day, bool isSelected) {
    return GestureDetector(
      onTap: () {
        print('Selected date: $date $day');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              date,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              day,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlotButton(String time, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(time, style: const TextStyle(color: Colors.black)),
    );
  }
}
