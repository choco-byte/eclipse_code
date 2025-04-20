import 'package:flutter/material.dart';

class MovieCard1 extends StatelessWidget {
  final image;
  final String title;
  final String agerate;
  final bool showStars;
  final double rating;
  // final weight;

  const MovieCard1({
    super.key,
    required this.image,
    required this.title,
    required this.agerate,
    required this.showStars,
    required this.rating
    // required this.weight,
  });

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.05;

    return 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(7), // Image border
                  child: Image.asset(image , fit: BoxFit.cover,
                  width: screenWidth* 9 / 28, 
                  height: screenWidth * 9 / 20,        // lebar mengikuti lebar layar
                  ),
              ),
              SizedBox(height: screenWidth * 0.025,),
              Text(title,
              style: TextStyle(
                  fontSize: fontSize *  1,
                  fontWeight: FontWeight.bold
                )),
              SizedBox(height: screenWidth * 0.02,),
              Container(
                alignment: Alignment.center,
                width: screenWidth * 0.1,
                color: const Color.fromARGB(255, 199, 199, 199),
                child: Text(agerate,
                style: TextStyle(
                  fontSize: fontSize * 0.5,
                  fontWeight: FontWeight.bold
                ),)
              ),
              SizedBox(height: screenWidth * 0.02,),
              if (showStars) // 👉 hanya ditampilkan jika true
              Row(
                children: List.generate(5, (index) {
                  if (index < rating) {
                    return Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    );
                  } else if (index < rating + 1) {
                    return Icon(
                      Icons.star_border,
                      color: Colors.amber,
                      size: 16,
                    );
                  } else {
                    return Icon(
                      Icons.star_border,
                      color: Colors.amber,
                      size: 16,
                    );
                  }
                }
              ),
            )
          ],
        );
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     ClipRRect(
        //         borderRadius: BorderRadius.circular(7), // Image border
        //           child: Image.asset('assets/dune.jpg', fit: BoxFit.cover,
        //           width: screenWidth* 9 / 28,         // lebar mengikuti lebar layar
        //           height: screenWidth * 9 / 20,
        //           ),
        //       ),
        //       SizedBox(height: screenWidth * 0.025,),
        //       Text('Dune',
        //       style: TextStyle(
        //           fontSize: fontSize * 1,
        //           fontWeight: FontWeight.bold
        //         )),
        //       SizedBox(height: screenWidth * 0.02,),
        //       Container(
        //         alignment: Alignment.center,
        //         width: screenWidth * 0.1,
        //         color: const Color.fromARGB(255, 199, 199, 199),
        //         child: Text('PG-13',
        //         style: TextStyle(
        //           fontSize: fontSize * 0.5,
        //           fontWeight: FontWeight.bold
        //         ),)
        //       )

        //   ],
        // ),
    //   ],
    // );
  }
}