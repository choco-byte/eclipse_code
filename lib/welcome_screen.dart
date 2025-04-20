import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eclipse_code/login.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var selectedIndex = 0;

  void _nextPage() {
    setState(() {
      if (selectedIndex < _pages.length - 1) {
        selectedIndex++;
      } else {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  final List<Widget> _pages = [
    WelcomePageOne(),
    WelcomePageTwo(),
    WelcomePageThree(),
    LoginScreen()

    //tambah class yang ada di halaman login.dart disini,cth: LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 700;

    final indicatorSize = isTablet ? 10.0 : 8.0;
    final indicatorSpacing = isTablet ? 12.0 : 10.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _pages[selectedIndex],
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
          Positioned(
            bottom: screenHeight * 0.04,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      _pages.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: indicatorSpacing),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            width: indicatorSize,
                            height: indicatorSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  selectedIndex == index
                                      ? Colors.white
                                      : Colors.grey[500],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 9.0, 
                    borderRadius: BorderRadius.circular(22),
                    child: ElevatedButton(
                      onPressed: _nextPage,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFF7B1113),
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 32.0 : 24.0,
                          vertical: isTablet ? 16.0 : 12.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: Text(
                        selectedIndex < _pages.length - 1
                            ? 'NEXT'
                            : 'GET STARTED',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 18.0 : 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomePageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600; 

    // --- Responsif Layout ---
    final topSectionHeightFraction = 0.5; 
    final bottomSectionHeightFraction = 1 - topSectionHeightFraction;
    final horizontalPadding = screenWidth * 0.08;
    final verticalPadding = screenHeight * 0.04;
    final borderRadius = screenWidth * 0.08;

    final titleFontSize = isTablet ? 26.0 : 22.0; 
    final subtitleFontSize = isTablet ? 40.0 : 34.0; 
    final descriptionFontSize = isTablet ? 18.0 : 16.0; 

    return Stack(
      children: [
        // Bottom Section - Teks 
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height:
              screenHeight *
              (bottomSectionHeightFraction - 0.08), 
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical:
                  verticalPadding * 1.3, 
            ),
            decoration: BoxDecoration(
              color: Color(0xFF7B1113),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover Your Next Movie',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.001,
                    ),
                    Text(
                      'Adventure',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.001,
                    ), 
                    Text(
                      'explore a vast library of movies, with exclusive showtimes and premium screenings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: descriptionFontSize,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // SVG Section
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 685,
          child: Padding(
            padding: EdgeInsets.only(
              left: horizontalPadding,
              right: horizontalPadding,
              top: 0, 
              bottom:
                  screenHeight * 0.17, 
            ),
            child: Align(
              alignment: Alignment.bottomCenter, 
              child: SvgPicture.asset(
                'assets/person.svg',
                width: 500 * 2, 
                height: 600 * 1, 
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WelcomePageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;

    final svgVerticalOffset = screenHeight * 0.15; 

    // --- Responsif Layout ---
    final topSectionHeightFraction = 0.5; 
    final bottomSectionHeightFraction = 1 - topSectionHeightFraction;
    final horizontalPadding = screenWidth * 0.08;
    final borderRadius = screenWidth * 0.08;
    final titleFontSize = isTablet ? 26.0 : 22.0; 
    final subtitleFontSize = isTablet ? 40.0 : 34.0; 
    final descriptionFontSize = isTablet ? 18.0 : 16.0; 

    return Stack(
      children: [
        // Top Section - Teks 
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: screenHeight * (bottomSectionHeightFraction - 0.08),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ).copyWith(top: screenHeight * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Unlock',
                  style: TextStyle(
                    color: Color(0xFF7B1113),
                    fontSize: titleFontSize * 1.3,
                  ),
                ),
                SizedBox(height: screenHeight * 0.001),
                Text(
                  'Your Movie Night,',
                  style: TextStyle(
                    fontSize: titleFontSize * 1.3,

                    color: Color(0xFF7B1113),
                    height: 0.9, // Try adjusting this value (lower for closer)
                  ),
                ),

                Text(
                  'Instantly',
                  style: TextStyle(
                    fontSize: subtitleFontSize * 1.50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7B1113),
                  ),
                ),
                SizedBox(height: screenHeight * 0.001),
                Text(
                  'Say goodbye to long queues and',
                  style: TextStyle(
                    fontSize: descriptionFontSize,
                    color: Color(0xFF7B1113),
                  ),
                ),
                Text(
                  'complicated bookings, book your',
                  style: TextStyle(
                    fontSize: descriptionFontSize,
                    color: Color(0xFF7B1113),
                  ),
                ),
                Text(
                  'tickets in seconds.',
                  style: TextStyle(
                    fontSize: descriptionFontSize,
                    color: Color(0xFF7B1113),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Bottom Section 
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: screenHeight * (bottomSectionHeightFraction - 0.08),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF7B1113),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
            ),
          ),
        ),

        // SVG section
        Positioned(
          top:
              screenHeight *
              (0.4 - svgVerticalOffset), 
          left: 0,
          right: 0,
          bottom:
              screenHeight * (0.3 - svgVerticalOffset), 
          child: Center(
            child: SvgPicture.asset(
              'assets/chair.svg',
              width: 500,
              height: 700,
              fit:
                  BoxFit
                      .contain, 
            ),
          ),
        ),
      ],
    );
  }
}

class WelcomePageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;


    final svgVerticalOffset = screenHeight * 0.15; 

    // --- Responsif Layout ---
    final topSectionHeightFraction = 0.5; 
    final bottomSectionHeightFraction = 1 - topSectionHeightFraction;
    final horizontalPadding = screenWidth * 0.08;
    final borderRadius = screenWidth * 0.08;

    final subtitleFontSize = isTablet ? 40.0 : 34.0; 

    return Stack(
      children: [
        // Top Section - Teks
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: screenHeight * (bottomSectionHeightFraction - 0.08),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ).copyWith(top: screenHeight * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Uncover',
                  style: TextStyle(
                    color: Color(0xFF7B1113),
                    fontSize: subtitleFontSize * 1.50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.001),
                Text(
                  'Cinematic',
                  style: TextStyle(
                    fontSize: subtitleFontSize * 1.50,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7B1113),
                    height: 0.9, 
                  ),
                ),
                SizedBox(height: screenHeight * 0.001),
                Text(
                  'Worlds',
                  style: TextStyle(
                    fontSize: subtitleFontSize * 1.50,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7B1113),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: subtitleFontSize * 1.50,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7B1113),
                    height: 0.5, 
                  ),
                ),
              ],
            ),
          ),
        ),
        // Bottom Section 
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: screenHeight * (bottomSectionHeightFraction - 0.08),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF7B1113),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
            ),
          ),
        ),

        // SVG section
        Positioned(
          top:
              screenHeight *
              (0.5 - svgVerticalOffset), 
          left: 0,
          right: 0,
          bottom:
              screenHeight * (0.3 - svgVerticalOffset), 
          child: Center(
            child: SvgPicture.asset(
              'assets/filmroll.svg',
              width: 500,
              height: 500,
              fit:
                  BoxFit
                      .contain, 
            ),
          ),
        ),
      ],
    );
  }
}
