import 'package:eclipse_code/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentSuccess extends StatelessWidget {
  final bool showSnackbar;

  const PaymentSuccess({super.key, this.showSnackbar = false});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (showSnackbar) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Payment success"),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.08), // Spacer atas
                SvgPicture.asset(
                  '8.svg',
                  width: screenWidth * 0.7,
                  height: screenWidth * 0.7,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenWidth * 0.08),
                Text(
                  'Thank You!',
                  style: TextStyle(
                    color: Color(0xFF7B1113),
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.1,
                  ),
                ),
                Text(
                  'Payment done Successfully',
                  style: TextStyle(
                    color: Color(0xFF7B1113),
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenWidth * 0.09),
                Text(
                  'You will be redirected to Home Page by clicking continue',
                  style: TextStyle(
                    color: Color(0xFF7B1113),
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenWidth * 0.1),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: screenWidth,
        height: screenWidth * 0.15,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7B1113),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Nav()),
            );
          },
          child: Text(
            'Continue',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05,
            ),
          ),
        ),
      ),
    );
  }
}
