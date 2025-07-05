import 'package:eclipse_code/movie_details.dart';
import 'package:eclipse_code/notification.dart';
import 'package:flutter/material.dart';
import 'package:eclipse_code/all_movies.dart';
import 'package:eclipse_code/news.dart';
import 'package:eclipse_code/news_detail.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> dataList = [
    {
      "img": "httyd.jpg",
      "title": "Box Office: 'How to Train Your Dragon' Roars to Record \$84M U.S. Opening, \$198M Globally",
      "desc": "The live-action adaptation of the 2010 animated film is firing on all cylinders, while Celine Song's specialty romantic drama 'Materialists' opened in third place.\n\nBorrowing a page from Disney's playbook is paying off big time for Universal at the box office, where the live-action remake of DreamWorks Animation's How to Train Your Dragon opened to a series-best \$83.7 million domestically and \$197.8 million globally, according to Sunday estimates. That includes a huge international haul of \$114.1 million from 81 markets.\n\nGraced with rave exit scores from moviegoers — including an A CinemaScore and an almost-unheard-of 98 percent rating on Rotten Tomatoes — the summer event pic is winning over both families and younger single adults who grew up on the animated franchise. It's the same phenomenon that has turned Disney's live-action Lilo & Stitch into ' box office blockbuster. Case in point: nearly half of those rushing out to see How to Train Your Dragon on Friday were Gen Zers between the ages of 13 and 24. This is the first time DreamWorks Animation, now owned by Universal, has done a live-action rendition, with a sequel already dated for 2027.\n\nThe movie boasts one of the top-10 starts of all time for a live-action reimagining, including the seventh-biggest at the worldwide box office, the eighth-biggest domestically and the sixth-biggest internationally, where it began playing in previews last weekend in 51 markets. Those grosses have been folded into the official \$114.1 million opening, which is led by Mexico with an eye-popping \$14 million and followed by the U.K. (\$11.4 million) and China (\$11.2 million), where it supplanted Lilo & Stitch to boast the biggest opening day for a live-action adaptation in five years. It's also the best non-holiday Friday opening for any 2025 Hollywood title. And — fueled by the best social audience scores of 2025 for an imported movie — Saturday's gross nearly doubled Friday's earnings to score the top Friday-to-Saturday increase of the year to date.",
      "time": "2 hours ago",
      "view": "879"
    },
    {
      "img": "avatar.jpg",
      "title": "Avatar: Fire And Ash First Look: Neytiri Prepares To Strike",
      "desc": "For the most part, Avatar: The Way Of Water was so titled for its focus on the oceans of Pandora – with Jake Sully, Neytiri, and their Na'vi children forced to flee the RDA and bed in with the aquamarine Metkayina clan. But the sequel could also have been named for the tears provoked by its final reel. The clash between Na'vi and man came with a major consequence: the death of Jake and Neytiri's firstborn son, Neteyam, tragically cut down on the cusp of adulthood. It's a loss that sent Neytiri into a fearsome rage against the RDA – and as we enter Avatar: Fire And Ash, that loss and “absolute devastation” is still fresh in the character's mind, says star Zoe Saldaña. \n\n“That pain is seamlessly followed up on,” she tells Empire in our latest Path To Pandora exclusive, running up to Fire And Ash's arrival. “And because it doesn't really have anywhere to go, and doesn't go away, rage can also come from it. [The Sullys] are going to be tested as a family.” You can see Neytiri in our world-exclusive first image from the film above, bow pulled taut, ready to strike – emblematic of her position in Fire And Ash. In short, Neytiri's going through it, her grief rippling through all her most important relationships. “Not only would everything that's happening compel her to question the bond she has with her husband,” Saldaña says, “but also her bond with herself, her people, her land, and the way the Na'vi are. She's going to question everything.”",
      "time": "18 hours ago",
      "view": "1.2k"
    },
  ];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text("Book your favorite movie here", style: TextStyle(fontSize: 16)),
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

                    Divider(height: 1, color: Colors.grey[300]),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "News",
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dataList.length,
                      padding: const EdgeInsets.only(left: 3, right: 3, top: 12),
                      itemBuilder: (context, index) {
                        final item = dataList[index];

                        return InkWell(
                          onTap: (){
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
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(screenWidth*0.03),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth*0.03),
                              child: SizedBox(
                                height: screenWidth*0.25,
                                child:  Row(
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
                                  SizedBox(width: screenWidth*0.03),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item['title']!.length > 80 ? '${item['title']!.substring(0, 80)}...' : item['title']!,
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.03,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.visibility, size: screenWidth*0.035, color: Colors.grey,),
                                                SizedBox(width: screenWidth*0.01,),
                                                Text(item['view']!, 
                                                style: TextStyle(
                                                  fontSize: screenWidth*0.03,
                                                  color: Colors.grey
                                                ),)
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
                              )

                            ),
                          )
                        );
                      },
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
