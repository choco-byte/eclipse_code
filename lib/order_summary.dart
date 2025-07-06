import 'package:eclipse_code/payment_success.dart';
import 'package:flutter/material.dart';


class OrderSummary extends StatelessWidget {
  final List<String> seat;
  final int price;
  const OrderSummary({super.key, required this.seat, required this.price});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int seatLength = seat.length;
    int totalPrice = price * seatLength;

    String seatDisplay;
    if (seat.isEmpty) {
      seatDisplay = '-';
    } else if (seatLength == 1) {
      seatDisplay = seat.first;
    } else {
      seatDisplay = '${seat.take(1).join(', ')}, ...';
    }

    return Scaffold(
      backgroundColor: Color(0xFF7B1113),
      appBar: AppBar(
        backgroundColor: Color(0xFF7B1113),
        title: Text("Order Summary", style: TextStyle(color: Colors.white, fontSize: screenWidth*0.05)),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(screenWidth*0.05),
          // padding: EdgeInsets.all(20.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child:
            SingleChildScrollView(
              child: 
              Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white,),
              child: Column(
                children: [
                  SizedBox(height: screenWidth*0.03),
                  Text('Order Summary', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth*0.07
                  )),
                  Divider(color: Colors.grey),
                  Container(
                    margin: EdgeInsets.all(screenWidth*0.05),
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenWidth*0.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7), // Image border
                              child: Image.asset('assets/nezha2.jpg', fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: screenWidth*0.05),
                        SizedBox(
                          width: screenWidth*0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ne Zha 2', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth*0.05
                              ),),
                              SizedBox(height: screenWidth*0.03,),
                              Text('Eclipse Cinema', style: TextStyle(
                                fontSize: screenWidth*0.035
                              ),),
                              SizedBox(height: screenWidth*0.02,),
                              Text('Sunday, 25th May 2025', style: TextStyle(
                                fontSize: screenWidth*0.035
                              ),),
                              SizedBox(height: screenWidth*0.02,),
                              Text('7:15 PM', style: TextStyle(
                                fontSize: screenWidth*0.035
                              ),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height: screenWidth*0.03,),
                  Container(
                    padding: EdgeInsets.only(left: screenWidth*0.05, right: screenWidth*0.05),
                    child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ID Order', style: TextStyle(
                            fontSize: screenWidth*0.037
                          ),),
                          Text('22095595995', style: TextStyle(
                            fontSize: screenWidth*0.037
                          ),)
                        ],
                      ),
                      SizedBox(height: screenWidth*0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Seat', style: TextStyle(
                            fontSize: screenWidth*0.037
                          ),),
                          Text(seatDisplay, style: TextStyle(
                            fontSize: screenWidth*0.037
                          ),)
                        ],
                      ),
                      SizedBox(height: screenWidth*0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payment Method', style: TextStyle(
                            fontSize: screenWidth*0.037
                          ),),
                          GestureDetector(
                            onTap: (){print('halloooo');}, //ubah dari print('yooo') ke print('halloooo')
                            child: Row(
                              children: [
                                Text('Select ', style: TextStyle(
                                  fontSize: screenWidth*0.037
                                ),),
                                Icon(Icons.keyboard_arrow_right, size: screenWidth*0.04,)
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: screenWidth*0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Price', style: TextStyle(
                            fontSize: screenWidth*0.037
                          ),),
                          Text('Rp $price x $seatLength', style: TextStyle(
                            fontSize: screenWidth*0.037
                          ),)
                        ],
                      ),
                    ],
                  ),),
                  SizedBox(height: screenWidth*0.03,),
                  Divider(color: Colors.grey),
                  SizedBox(height: screenWidth*0.03,),
                  Container(
                    padding: EdgeInsets.only(left: screenWidth*0.05, right: screenWidth*0.05, bottom: screenWidth*0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: TextStyle(
                          fontSize: screenWidth*0.06, fontWeight: FontWeight.bold
                        ),),
                        Text('Rp $totalPrice', style: TextStyle(
                          fontSize: screenWidth*0.06
                        ),)
                      ],
                    ),
                  )
                  
                ],
              ),
            ),
            ),),
             
            SizedBox(height: screenWidth*0.07),
            SizedBox(
              width: screenWidth*0.5,
              height: screenWidth*0.15,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth*0.02)), 
                ),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSuccess(showSnackbar: true,)));},
                child: Text('Checkout', style: TextStyle(
                  color: Color(0xFF7B1113),
                  fontSize: screenWidth*0.06
                ),),
              ),
            )
          ],
        ),
        )

      ),
    );
  }}