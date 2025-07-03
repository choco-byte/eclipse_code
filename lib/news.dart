import 'package:flutter/material.dart';
import 'package:eclipse_code/news_detail.dart';

class News extends StatelessWidget {
  News({super.key});

  final List<Map<String, String>> dataList = [
    {
      "img": "httyd.jpg",
      "title": "Box Office: 'How to Train Your Dragon' Roars to Record \$84M U.S. Opening, \$198M Globally",
      "desc": "The live-action adaptation of the 2010 animated film is firing on all cylinders, while Celine Song's specialty romantic drama 'Materialists' opened in third place.\n\nBorrowing a page from Disney's playbook is paying off big time for Universal at the box office, where the live-action remake of DreamWorks Animation's How to Train Your Dragon opened to a series-best \$83.7 million domestically and \$197.8 million globally, according to Sunday estimates. That includes a huge international haul of \$114.1 million from 81 markets.\n\nGraced with rave exit scores from moviegoers — including an A CinemaScore and an almost-unheard-of 98 percent rating on Rotten Tomatoes — the summer event pic is winning over both families and younger single adults who grew up on the animated franchise. It's the same phenomenon that has turned Disney's live-action Lilo & Stitch into ' box office blockbuster. Case in point: nearly half of those rushing out to see How to Train Your Dragon on Friday were Gen Zers between the ages of 13 and 24. This is the first time DreamWorks Animation, now owned by Universal, has done a live-action rendition, with a sequel already dated for 2027.\n\nThe movie boasts one of the top-10 starts of all time for a live-action reimagining, including the seventh-biggest at the worldwide box office, the eighth-biggest domestically and the sixth-biggest internationally, where it began playing in previews last weekend in 51 markets. Those grosses have been folded into the official \$114.1 million opening, which is led by Mexico with an eye-popping \$14 million and followed by the U.K. (\$11.4 million) and China (\$11.2 million), where it supplanted Lilo & Stitch to boast the biggest opening day for a live-action adaptation in five years. It's also the best non-holiday Friday opening for any 2025 Hollywood title. And — fueled by the best social audience scores of 2025 for an imported movie — Saturday's gross nearly doubled Friday's earnings to score the top Friday-to-Saturday increase of the year to date.",
      "time": "2 hours ago",
      "view": "879"
    },
    {
      "img": "avatar.jpg", // Ganti dengan gambar asli lainnya jika ada
      "title": "Avatar: Fire And Ash First Look: Neytiri Prepares To Strike",
      "desc": "For the most part, Avatar: The Way Of Water was so titled for its focus on the oceans of Pandora – with Jake Sully, Neytiri, and their Na'vi children forced to flee the RDA and bed in with the aquamarine Metkayina clan. But the sequel could also have been named for the tears provoked by its final reel. The clash between Na'vi and man came with a major consequence: the death of Jake and Neytiri's firstborn son, Neteyam, tragically cut down on the cusp of adulthood. It's a loss that sent Neytiri into a fearsome rage against the RDA – and as we enter Avatar: Fire And Ash, that loss and “absolute devastation” is still fresh in the character's mind, says star Zoe Saldaña. \n\n“That pain is seamlessly followed up on,” she tells Empire in our latest Path To Pandora exclusive, running up to Fire And Ash's arrival. “And because it doesn't really have anywhere to go, and doesn't go away, rage can also come from it. [The Sullys] are going to be tested as a family.” You can see Neytiri in our world-exclusive first image from the film above, bow pulled taut, ready to strike – emblematic of her position in Fire And Ash. In short, Neytiri's going through it, her grief rippling through all her most important relationships. “Not only would everything that's happening compel her to question the bond she has with her husband,” Saldaña says, “but also her bond with herself, her people, her land, and the way the Na'vi are. She's going to question everything.”",
      "time": "18 hours ago",
      "view": "1.2k"
    },
    {
      "img": "lilo.jpg",
      "title": "'Lilo & Stitch's Global Box Office Passes James Gunn's Last Marvel Movie",
      "desc": "Having completed three full weeks of release in theaters worldwide, Disney's Lilo & Stitch remake is still on track to pass the coveted \$1 billion mark at the global box office. The movie hit a couple of notable milestones this weekend, as it crosses its fingers and hopes to avoid the fate that befell A Minecraft Movie not too long ago. Directed by Jared Hess, that film delivered the year's biggest opening weekend haul, but stalled at around \$950 million worldwide. Lilo & Stitch, on the other hand, is all set to become Disney's first billion-dollar hit since Moana 2 last year. \n\nWith \$366 million domestically and another \$492 million from overseas markets, the movie's cumulative global haul now stands at a massive \$858 million. In three weeks of release, Lilo & Stitch has overtaken the lifetime global haul of fellow family movies such as Mufasa: The Lion King, Inside Out, and Coco. Lilo & Stitch also out-grossed the \$836 million lifetime global haul of Michael Bay's second Transformers movie, Transformers: Revenge of the Fallen, and passed the \$856 million lifetime haul of James Gunn's final Marvel movie, Guardians of the Galaxy Vol. 3. It cost a reported \$250 million to produce, which is over twice as much as what Disney reportedly spent on Lilo & Stitch. \n\nThis weekend, the film took a direct hit from DreamWorks' How to Train Your Dragon remake, which made over \$200 million at the worldwide box office. Lilo & Stitch opened to positive reviews, and appears to have settled at a 72% Rotten Tomatoes score. The audience, however, was far more appreciative of the movie, awarding it a “verified hot” 93% score. Lilo & Stitch is the remake of 2002's animated original, which was directed by Dean DeBlois and Chris Sanders. The original has since become something of a cult hit among millennials.\n\n'Lilo & Stitch' Took a Hit from 'How to Train Your Dragon'\n\nInterestingly, DeBlois and Sanders also directed the original How to Train Your Dragon, which debuted in 2010 and grossed almost \$500 million worldwide. Like the animated Lilo & Stitch, the original How to Train Your Dragon also became a favorite among audiences that are presumably now in their 30s. They awarded the remake a stunning 98% score on Rotten Tomatoes. It remains to be seen if How to Train Your Dragon's arrival acts as a hurdle in Lilo & Stitch's path to \$1 billion. You can watch both films in theaters, and stay tuned to Collider for more updates.",
      "time": "3 days ago",
      "view": "8.9k"
    },
    {
      "img": "elio.jpeg",
      "title": "'We Definitely Have The Classics': Which Pixar Easter Eggs Are In Elio Teased By Directors",
      "desc": "Pixar's Elio is in theaters June 20, and while the film hasn't been seen yet, the director is already teasing which Pixar Easter eggs will be in the film. Pixar is known for its Easter eggs, with each film having a variety of references to the broader Pixar filmography. Luckily, Elio will be no exception, and the directors have already let audiences in on what Easter eggs could appear in the upcoming film.\n\nSpeaking with ScreenRant's Ash Crossan, Elio directors Domee Shi and Madeline Sharafian were asked about which of the classic Pixar Easter eggs would appear in the upcoming film. The duo gave a surprising amount of information, mentioning several specific references that will pop up in the film. They also discussed a tease of a future Pixar project that can be seen in Elio. Here are the directors' full comments:\n\nAsh Crossan: I know Pixar movies are famous for having a couple of Easter eggs hidden throughout — the Pizza Planet truck, A113, sometimes teases for the next movie. I was very visually distracted and wasn't seeking those out, so I'm curious — are they there, and are there any hints on where I should be looking next time I watch?\n\nDomee Shi: Yes. All those Easter eggs you mentioned are in the movie.\n\nMadeline Sharafian: It's fun. I'm glad. You shouldn't really be thinking about them the first time you watch the movie.\n\nAsh Crossan: Yeah, that's like a fourth or fifth time thing.\n\nMadeline Sharafian: But we definitely have the classics: the Luxo Ball, A113. And we do have a hint toward our next film. It's in the universe somewhere. It's a character, and it's for the film Hoppers. It's onscreen for a pretty long time and kind of featured, which is rare. Normally it's not featured like that. But yeah... I don't know if I want to say more than that.\n\nWhat These Pixar Easter Eggs Mean For Elio\n\nLuckily, Elio will be continuing the long-standing trend of featuring many iconic Pixar Easter eggs. The Pizza Planet truck, 'A113,' the Luxo Ball, and more have been present in every Pixar movie, so it would be odd for Elio to change it now. While it is an original property, it is a Pixar movie at its core, and it is set to continue the legacy of the Pixar iconography that has been around since the very beginning.\n\nThe more interesting Easter egg that was mentioned is the Hoppers tease. While most Pixar movies do tease the studio's next film, Sharafian's comments imply that the Hoppers tease is bigger than most. It is specifically mentioned that a Hoppers character will appear in the film, meaning that it may be more obvious than some of the other subtle teases.\n\nOur Take On Elio's Pixar Easter Eggs\n\nNot having these classic Easter eggs in Elio would seriously hurt the upcoming film, making it feel like the black sheep of the Pixar brand. So, it is nice to get some confirmation that these elements will be in the film ahead of time. This announcement gives viewers a list of what to look for, and the hunt will soon be on for Elio's various Easter eggs and references.",
      "time": "2 weeks ago",
      "view": "509"
    },
    {
      "img": "dumbonews.jpeg",
      "title": "Tim Burton's Dumbo remake fails to fly with many film critics",
      "desc": "Tim Burton's reimagining of Disney's 1941 animated classic Dumbo has failed to dazzle many film critics ahead of its release on Friday.\n\nThe Guardian's Peter Bradshaw gave the film one star, calling it 'pointlessly complicated and drawn out'.\n\nIn his two-star review, The Daily Telegraph's Robbie Collin said it 'has to be counted as a failure'.\n\nThe live-action/CGI film stars Danny DeVito, Colin Farrell, Michael Keaton and Eva Green.\n\nThandie Newton's daughter Nico Parker makes her film debut as the daughter of Farrell's former circus star, taking a shine to the big-eared baby elephant.\n\nDirector Burton is known for fantastical films like Edward Scissorhands and Sleepy Hollow, and for reimagining Batman, Charlie and the Chocolate Factory and Alice in Wonderland.\n\nThe Hollywood Reporter's David Rooney declared his new version of Dumbo a 'frustratingly uneven picture' that 'holds the attention but too seldom tugs at the heartstrings'.\n\n'Dark whimsy'\n\nVariety's Owen Gleiberman said it 'transforms a miraculous tale into a routine story by weighing it down with a lot of nuts and bolts it didn't need'.\n\nOther critics found it more endearing. Empire's Ben Travis awarded it four stars, calling it 'an enchanting blend of Disney twinkle and Tim Burton's dark whimsy'.\n\nHowever, Peter Bradshaw's Guardian review called it 'a flightless pachyderm of a film that saddles itself with 21st Century shame at the idea of circus animals'.\n\nWhile admitting there were some moments where Dumbo 'teeters on the verge of flight', those moments were 'cancelled out by boredom, as the pointlessly complicated and drawn out story grinds on to its tiresome conclusion'.\n\n'Fails to jerk tears'\n\nIn the Telegraph, Robbie Collin wrote that, while the elephant 'looks great', the 'remake never gets off the ground'.\n\nCollin noted that the 2019 version is twice as long as the original and is filled with 'modish new themes to fill the time, including animal cruelty, makeshift families and corporate exploitation of artists'.\n\nThe Daily Mirror's Chris Hunneysett gave the film three stars, writing: 'For a film set in the circus, it lacks the toothy grandstanding pizzazz which Hugh Jackman brought to his smash, The Greatest Showman...\n\n'This Dumbo story does occasionally fly - but only just.'\n\n'Looks glorious'\n\nJamie East's three-star review for The Sun said the remake 'has all the darkness we expect from a Disney film', such as death, abuse and bigotry. But he said it lacked heart.\n\n'It's as if Tim Burton kept forgetting to be Tim Burton and felt like he should be making The Greatest Showman 2,' he wrote.\n\n'Having said that - It looks utterly glorious. The animals are perfectly rendered and the Art-Deco universe is splendorous.'",
      "time": "2 weeks ago",
      "view": "1k"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B1113),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("News",
            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        padding: const EdgeInsets.all(12),
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
                              fontSize: screenWidth * 0.04,
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
    );
  }
}
