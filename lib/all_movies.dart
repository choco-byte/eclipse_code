import 'package:flutter/material.dart';
import 'package:eclipse_code/components/movie_card1.dart';

void main() {
  runApp(MaterialApp(
    home: MovieTabsPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class Movie {
  final String title;
  final String imageUrl;
  final String rating;

  Movie(this.title, this.imageUrl, this.rating);
}



class MovieTabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Movies',
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
                  Tab(text: 'Now Showing'),
                  Tab(text: 'Coming Soon'),
                ],
              ),
              
            ),
            Divider(height: 0, color: Colors.white,),
            Expanded(
              child: TabBarView(
                children: [
                  NowShowingMovies(),
                  ComingSoonMovies()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NowShowingMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.09),
          child: 
          Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieCard1(image: 'assets/nezha2.jpg', 
                title: 'Ne Zha', 
                agerate: 'PG', showStars: true, rating: 5.0,),
               
                MovieCard1(image: 'assets/dune.jpg', 
                title: 'Dune', 
                agerate: 'PG-13', showStars: true, rating: 4.0,),
              ],
            ),
            SizedBox(height: screenWidth * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieCard1(image: 'assets/maleficent2.jpg', 
                title: 'Maleficent 2', 
                agerate: 'PG-13', showStars: true, rating: 5.0,),
                MovieCard1(image: 'assets/deadpool.jpg', 
                title: 'Deadpool', 
                agerate: 'R', showStars: true, rating: 4.0),
              ],
            ),
            SizedBox(height: screenWidth * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieCard1(image: 'assets/The Lion King.jpg', 
                title: 'The Lion King', 
                agerate: 'G', showStars: true, rating: 4.0,),
                MovieCard1(image: 'assets/scream.jpg', 
                title: 'Scream Vi', 
                agerate: 'NC-17', showStars: true, rating: 3.0,),
              ],
            ),
            SizedBox(height: screenWidth * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieCard1(image: 'assets/mario.jpg', 
                title: 'Super Mario', 
                agerate: 'G', showStars: true, rating: 5.0,),
                MovieCard1(image: 'assets/dumbo.jpg', 
                title: 'Dumbo', 
                agerate: 'PG', showStars: true, rating: 5.0,),
              ],
            ),
            SizedBox(height: screenWidth * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieCard1(image: 'assets/lilo.jpg', 
                title: 'Lilo & Stitch', 
                agerate: 'G', showStars: true, rating: 5.0,),
              ],
            ),
          ],
        ),
        )
      ],
    );
  }
}

class ComingSoonMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      children: [ 
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.09),
          child: 
          Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieCard1(image: 'assets/scream7.jpg', 
                title: 'Scream VII', 
                agerate: 'NC-17', showStars: false, rating: 0.0,),
                MovieCard1(image: 'assets/kk.jpg', 
                title: 'Karate Kid', 
                agerate: 'PG-13', showStars: false, rating: 0.0,),
              ],
            ),
            SizedBox(height: screenWidth * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieCard1(image: 'assets/httyd.jpg', 
                title: 'HTTYD', 
                agerate: 'G', showStars: false, rating: 0.0,),
                MovieCard1(image: 'assets/superman.jpg', 
                title: 'Superman', 
                agerate: 'PG-13', showStars: false, rating: 0.0,),
              ],
            ),
            SizedBox(height: screenWidth * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieCard1(image: 'assets/Smurfs 2025.jpg', 
                title: 'Smurfs', 
                agerate: 'G', showStars: false, rating: 0.0,),
                MovieCard1(image: 'assets/avatar.jpg', 
                title: 'Avatar', 
                agerate: 'PG-13', showStars: false, rating: 0.0,),
              ],
            ),
            SizedBox(height: screenWidth * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieCard1(image: 'assets/jw.jpg', 
                title: 'Jurassic World', 
                agerate: 'PG-13', showStars: false, rating: 0.0,),
                MovieCard1(image: 'assets/ELIO (2025).jpg', 
                title: 'Elio', 
                agerate: 'PG-13', showStars: false, rating: 0.0,),
              ],
            ),
          ],
        ),
        )
      ],
    );
  }
}

