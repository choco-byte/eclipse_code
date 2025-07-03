import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eclipse_code/news.dart';
import 'package:eclipse_code/home_screen.dart';


class PaymentSuccess extends StatelessWidget {
  final bool showSnackbar;

  const PaymentSuccess({super.key, this.showSnackbar = false});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              '8.svg',
              width: screenWidth*1,
              height: screenWidth*1,
              fit: BoxFit.contain,
            ),
            Text('Thank You!', 
            style: TextStyle(
              color: Color(0xFF7B1113), 
              fontWeight: FontWeight.bold,
              fontSize: screenWidth*0.1
              ),
            ),
            Text('Payment done Successfully', 
            style: TextStyle(
              color: Color(0xFF7B1113),
              fontSize: screenWidth*0.04,
              fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: screenWidth*0.09),
            Text('You will be redirected to Home Page by clicking continue', 
            style: TextStyle(
              color: Color(0xFF7B1113),
              fontSize: screenWidth*0.04,
              fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenWidth*0.1),
          ],
        ),
        
      ),
      bottomNavigationBar: SizedBox(
        width: screenWidth,
        height: screenWidth*0.15,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF7B1113),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero), 
        ),
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));},
          child: Text('Continue', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth*0.05
          ),),
        ),
      ),
    );
  }
}
