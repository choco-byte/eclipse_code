import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Color(0xFF7B1113),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: "Tickets",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),

      // ✅ Body scrollable + safe + proper padding
      body: SafeArea(
        child: Column(
          children: [
            // 🔍 Search Bar & Icon
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.notifications, color: Colors.white),
                ],
              ),
            ),

            // ✅ Content yang bisa discroll
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Hello, User!",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text("Book your favorite movie here"),
                    const SizedBox(height: 10),

                    // Banner
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset("assets/banner.png"),
                    ),

                    const SizedBox(height: 20),

                    // NOW SHOWING
                    _buildSectionHeader("Now Showing"),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildMovieItem("assets/nezha.jpg", "Ne Zha 2"),
                          _buildMovieItem("assets/dune.jpg", "Dune"),
                          _buildMovieItem("assets/maleficent.jpeg", "Maleficent 2"),
                          _buildMovieItem("assets/deadpool.jpg", "Deadpool & Wolverine"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // COMING SOON
                    _buildSectionHeader("Coming Soon"),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildMovieItem("assets/nezha.jpg", "Scream VII"),
                          _buildMovieItem("assets/nezha.jpg", "Karate Kid"),
                          _buildMovieItem("assets/nezha.jpg", "Dragon"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30), // spacing before end
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieItem(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
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
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "See All",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF7B1113),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
