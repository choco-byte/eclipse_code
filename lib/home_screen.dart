import 'package:eclipse_code/movie_details.dart';
import 'package:eclipse_code/notification.dart';
import 'package:flutter/material.dart';
import 'package:eclipse_code/all_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Color(0xFF7B1113),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search in Eclipse Cinema",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 6),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello, User!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text("Book your favorite movie here"),
                    const SizedBox(height: 10),
                    // Banner
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset("assets/banner.png"),
                    ),

                    const SizedBox(height: 20),
                    _buildSectionHeader("Now Showing", context),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildMovieItem(
                            "assets/nezha2.jpg",
                            "Ne Zha 2",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailPage(),
                                ),
                              );
                            },
                          ),
                          
                          _buildMovieItem("assets/dune.jpg", "Dune"),
                          _buildMovieItem(
                            "assets/maleficent2.jpg",
                            "Maleficent 2",
                          ),
                          _buildMovieItem(
                            "assets/deadpool.jpg",
                            "Deadpool & Wolverine",
                          ),
                          _buildMovieItem("assets/lilo.jpg", "Lilo"),
                        ],
                      ),
                    ),

                    Divider(height: 1, color: Colors.grey[300]),
                    const SizedBox(height: 20),
                    _buildSectionHeader("Coming Soon", context),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildMovieItem("assets/scream7.jpg", "Scream VII"),
                          _buildMovieItem("assets/kk.jpg", "Karate Kid"),
                          _buildMovieItem(
                            "assets/httyd.jpg",
                            "How To Train Your Dragon",
                          ),
                          _buildMovieItem("assets/superman.jpg", "Superman"),
                          _buildMovieItem("assets/Smurfs 2025.jpg", "Smurfs"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieItem(
    String imagePath,
    String title, {
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 120,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 120,
              child: Text(
                title,
                style: const TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovieTabsPage()),
            );
          },
          child: Text(
            "See All",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF7B1113),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
