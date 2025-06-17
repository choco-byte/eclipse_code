import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  final String img;
  final String title;
  final String desc;
  final String time;
  final String view;

  const NewsDetail({
    super.key,
    required this.img,
    required this.title,
    required this.desc,
    required this.time, 
    required this.view
  });

  // Kata-kata yang ingin dibold otomatis
  List<String> get boldKeywords => [
        "'Lilo & Stitch' Took a Hit from 'How to Train Your Dragon'",
        "Our Take On Elio's Pixar Easter Eggs",
        "What These Pixar Easter Eggs Mean For Elio",
        "Tim Burton's reimagining of Disney's 1941 animated classic Dumbo has failed to dazzle many film critics ahead of its release on Friday.",
        "'Dark whimsy'",
        "'Fails to jerk tears'",
        "'Looks glorious'"
      ];
      

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B1113),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "News",
          style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                img,
                width: screenWidth,
                height: screenWidth*0.7,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenWidth*0.05),
            Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenWidth*0.02,),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.visibility, size: screenWidth*0.035, color: Colors.grey,),
                    SizedBox(width: screenWidth*0.01,),
                    Text(
                      view,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth*0.03,),
                Container(
                  height: screenWidth*0.03,
                  width: 1,
                  color: Colors.grey,
                ),
                SizedBox(width: screenWidth*0.03,),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: Colors.grey
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth*0.04),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            
            SizedBox(height: screenWidth*0.05),
            buildRichText(desc.isNotEmpty ? desc : 'No description available.', boldKeywords, screenWidth * 0.04),
          ],
        ),
      ),
    );
  }

  RichText buildRichText(String text, List<String> boldWords, double fontSize) {
    final List<TextSpan> spans = [];
    int start = 0;
    String lowerText = text.toLowerCase();

    while (start < text.length) {
      int matchIndex = text.length;
      String? matchedWord;

      for (final word in boldWords) {
        final index = lowerText.indexOf(word.toLowerCase(), start);
        if (index != -1 && index < matchIndex) {
          matchIndex = index;
          matchedWord = word;
        }
      }

      if (matchedWord == null) {
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }

      if (matchIndex > start) {
        spans.add(TextSpan(text: text.substring(start, matchIndex)));
      }

      spans.add(TextSpan(
        text: text.substring(matchIndex, matchIndex + matchedWord.length),
        style: TextStyle(fontWeight: FontWeight.bold),
      ));

      start = matchIndex + matchedWord.length;
    }

    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black87, fontSize: fontSize),
        children: spans,
      ),
    );
  }
}
