import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WatchlistPage(),
    );
  }
}

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            "My Movies",
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            indicatorWeight: 2.0,
            tabs: [
              Tab(text: 'WATCHED'),
              Tab(text: 'WATCHLIST'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WatchedTab(),
            WatchlistTab(),
          ],
        ),
      ),
    );
  }
}

class WatchlistTab extends StatelessWidget {
  const WatchlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: MovieCard(
        imagePath: 'assets/nezha_poster.jpeg',
        title: 'NE ZHA 2',
        rating: '9.9',
        genre: 'Fantasy, Animation',
        duration: '2h 25min',
        cast: 'Joseph, Han Mo, Chen Hao, Lu Yi...',
        chipLabel: 'Now Showing',
        chipColor: Colors.blue,
        showRatingPrompt: false,
      ),
    );
  }
}

class WatchedTab extends StatelessWidget {
  const WatchedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: MovieCard(
        imagePath: 'assets/nezha_poster.jpeg',
        title: 'NE ZHA 2',
        rating: '9.9',
        genre: 'Fantasy, Animation',
        duration: '2h 25min',
        cast: 'Joseph, Han Mo, Chen Hao, Lu Yi...',
        chipLabel: '',
        chipColor: Colors.transparent,
        showRatingPrompt: true,
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String rating;
  final String genre;
  final String duration;
  final String cast;
  final String chipLabel;
  final Color chipColor;
  final bool showRatingPrompt;

  const MovieCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.genre,
    required this.duration,
    required this.cast,
    required this.chipLabel,
    required this.chipColor,
    required this.showRatingPrompt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            height: 120,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  const SizedBox(width: 4),
                  Text(rating),
                  if (chipLabel.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(
                        chipLabel,
                        style: const TextStyle(fontSize: 12),
                      ),
                      backgroundColor: chipColor,
                      labelStyle: const TextStyle(color: Colors.white),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 4),
              Text("Genre: $genre", style: const TextStyle(color: Colors.grey)),
              Text("Duration: $duration", style: const TextStyle(color: Colors.grey)),
              Text("Cast: $cast",
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ],
    );
  }
}
