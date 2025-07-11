import 'package:eclipse_code/movie_details.dart';
import 'package:eclipse_code/notification.dart';
import 'package:flutter/material.dart';
import 'package:eclipse_code/all_movies.dart';
import 'package:eclipse_code/news.dart';
import 'package:eclipse_code/news_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> dataList = [
    {
      "img": "httyd.jpg",
      "title": "How to Train Your Dragon",
      "desc": "The live-action adaptation...",
      "time": "2 hours ago",
      "view": "879"
    },
    {
      "img": "avatar.jpg",
      "title": "Avatar: Fire And Ash",
      "desc": "For the most part, Avatar...",
      "time": "18 hours ago", 
      "view": "1.2k"
    },
  ];

  final List<Map<String, dynamic>> nowShowingMovies = [
    {"img": "assets/nezha2.jpg", "title": "Ne Zha 2"},
    {"img": "assets/dune.jpg", "title": "Dune"},
    {"img": "assets/maleficent2.jpg", "title": "Maleficent 2"},
    {"img": "assets/deadpool.jpg", "title": "Deadpool & Wolverine"},
    {"img": "assets/lilo.jpg", "title": "Lilo"},
  ];

  final List<Map<String, dynamic>> comingSoonMovies = [
    {"img": "assets/scream7.jpg", "title": "Scream VII"},
    {"img": "assets/kk.jpg", "title": "Karate Kid"},
    {"img": "assets/httyd.jpg", "title": "How To Train Your Dragon"},
    {"img": "assets/superman.jpg", "title": "Superman"},
    {"img": "assets/Smurfs 2025.jpg", "title": "Smurfs"},
  ];

  String searchQuery = '';
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    // Filter movies based on search query
    final filteredNowShowing = nowShowingMovies.where((movie) {
      return movie['title'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    final filteredComingSoon = comingSoonMovies.where((movie) {
      return movie['title'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: const Color(0xFF7B1113),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                          isSearching = value.isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search movies...",
                        prefixIcon: const Icon(Icons.search),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 6),
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
                    if (!isSearching) ...[
                      const Text(
                        "Hello, User!",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Text("Book your favorite movie here", style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset("assets/banner.png"),
                      ),
                    ],

                    if (isSearching) 
                      _buildSearchResults(filteredNowShowing, filteredComingSoon, context)
                    else ...[
                      const SizedBox(height: 20),
                      _buildSectionHeader("Now Showing", context),
                      const SizedBox(height: 10),
                      _buildMovieList(nowShowingMovies, context),
                      
                      const Divider(height: 1, color: Colors.grey),
                      const SizedBox(height: 20),
                      _buildSectionHeader("Coming Soon", context),
                      const SizedBox(height: 10),
                      _buildMovieList(comingSoonMovies, context),
                    ],

                    const Divider(height: 1, color: Colors.grey),
                    const SizedBox(height: 20),
                    if (!isSearching) _buildNewsSection(context),
                    
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

  Widget _buildSearchResults(
    List<Map<String, dynamic>> nowShowingResults,
    List<Map<String, dynamic>> comingSoonResults,
    BuildContext context
  ) {
    final allResults = [...nowShowingResults, ...comingSoonResults];
    
    if (allResults.isEmpty) {
      return const Center(
        child: Text("No movies found", style: TextStyle(fontSize: 16)),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
      ),
      itemCount: allResults.length,
      itemBuilder: (context, index) {
        final movie = allResults[index];
        return _buildMovieGridItem(movie['img'], movie['title'], context);
      },
    );
  }

  Widget _buildMovieList(List<Map<String, dynamic>> movies, BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return _buildMovieItem(
            movies[index]['img'],
            movies[index]['title'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildNewsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "News",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => News()),
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
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dataList.length,
          padding: const EdgeInsets.only(top: 12),
          itemBuilder: (context, index) {
            final item = dataList[index];
            return _buildNewsItem(item, context);
          },
        ),
      ],
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

  Widget _buildMovieGridItem(String imagePath, String title, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(),
          ),
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNewsItem(Map<String, String> item, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetail(
                img: item['img'] ?? '',
                title: item['title'] ?? '',
                desc: item['desc'] ?? '',
                time: item['time'] ?? '',
                view: item['view'] ?? '',
              ),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: SizedBox(
            height: screenWidth * 0.25,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.asset(
                    item['img']!,
                    height: screenWidth * 0.25,
                    width: screenWidth * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['title']!.length > 80 
                            ? '${item['title']!.substring(0, 80)}...' 
                            : item['title']!,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.visibility, size: screenWidth * 0.035, color: Colors.grey),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                item['view']!,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: Colors.grey
                                ),
                              )
                            ],
                          ),
                          Text(
                            item['time']!,
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: Colors.grey
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
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