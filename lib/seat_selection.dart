import 'package:eclipse_code/order_summary.dart';
import 'package:flutter/material.dart';


class CinemaSeatApp extends StatefulWidget {
  final String selectedTime;

  const CinemaSeatApp({Key? key, required this.selectedTime}) : super(key: key);

  @override
  _CinemaSeatAppState createState() => _CinemaSeatAppState();
}

class _CinemaSeatAppState extends State<CinemaSeatApp> {
  List<String> selectedSeats = [];

  final List<List<String>> leftSeats = [
    ['', 'I1', 'I2', 'I3', 'I4'],
    ['H1', 'H2', 'H3', 'H4', 'H5'],
    ['G1', 'G2', 'G3', 'G4', 'G5'],
    ['F1', 'F2', 'F3', 'F4', 'F5'],
    ['E1', 'E2', 'E3', 'E4', 'E5'],
    ['D1', 'D2', 'D3', 'D4', 'D5'],
    ['C1', 'C2', 'C3', 'C4', 'C5'],
    ['B1', 'B2', 'B3', 'B4', 'B5'],
    ['', 'A1', 'A2', 'A3', 'A4']
  ];

  final List<List<String>> rightSeats = [
    ['I5', 'I6', 'I7', 'I8', ''],
    ['H6', 'H7', 'H8', 'H9', 'H10'],
    ['G6', 'G7', 'G8', 'G9', 'G10'],
    ['F6', 'F7', 'F8', 'F9', 'F10'],
    ['E6', 'E7', 'E8', 'E9', 'E10'],
    ['D6', 'D7', 'D8', 'D9', 'D10'],
    ['C6', 'C7', 'C8', 'C9', 'C10'],
    ['B6', 'B7', 'B8', 'B9', 'B10'],
    ['A5', 'A6', 'A7', 'A8', '']
  ];

  Widget buildSeat(String seatId, double seatSize) {
    if (seatId == '') return SizedBox(width: seatSize, height: seatSize);

    bool isSelected = selectedSeats.contains(seatId);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedSeats.remove(seatId);
          } else {
            selectedSeats.add(seatId);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(seatSize * 0.2),
        width: seatSize,
        height: seatSize,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(seatSize * 0.2),
        ),
        alignment: Alignment.center,
        child: Text(
          seatId,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: seatSize * 0.3,
          ),
        ),
      ),
    );
  }

  Widget buildRow(
      List<String> left, List<String> right, double seatSize, double spacing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...left.map((s) => buildSeat(s, seatSize)).toList(),
        SizedBox(width: spacing),
        ...right.map((s) => buildSeat(s, seatSize)).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final seatSize = screenWidth * 0.055; 
    final spacing = screenWidth / 30; 
    final int seatPrice = 50000;

    return Scaffold(
      backgroundColor: Color(0xFF7B1113),
      appBar: AppBar(
        backgroundColor: Color(0xFF7B1113),
        title: Text("Select Seat", style: TextStyle(color: Colors.white, fontSize: screenWidth*0.05)),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [ Expanded(
          child: SingleChildScrollView(
            child: Center(
              child:
              Container(
                margin: EdgeInsets.only(top: screenWidth*0.02, bottom: screenWidth*0.02),
                child:
               Column(
                children: [
                  ...List.generate(leftSeats.length, (index) {
                  return buildRow(leftSeats[index], rightSeats[index], seatSize, spacing);
                }),
               
                ],
              ))
            )
          )
        ),
        Container(
          margin: EdgeInsets.only(left: screenWidth*0.03, right: screenWidth*0.03, top: screenWidth*0.04),
          child: ScreenCurve(width: screenWidth * 0.5, height: screenWidth * 0.05),
        ),
        Container(
          margin: EdgeInsets.only(left: screenWidth*0.05, right: screenWidth*0.05, top: screenWidth*0.04),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(seatSize * 0.2),
                        color: Colors.white,),
                      child: SizedBox(width: seatSize, height: seatSize,),
                    ),
                    SizedBox(width: screenWidth*0.02),
                    Text('Available', style: TextStyle(
                      color: Colors.white, fontSize: screenWidth*0.037
                    ),)
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(seatSize * 0.2),
                        color: Colors.grey,),
                      child: SizedBox(width: seatSize, height: seatSize,),
                    ),
                    SizedBox(width: screenWidth*0.02),
                    Text('Unavailable', style: TextStyle(
                      color: Colors.white, fontSize: screenWidth*0.037
                    ))
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(seatSize * 0.2),
                        color: Colors.green,),
                      child: SizedBox(width: seatSize, height: seatSize,),
                    ),
                    SizedBox(width: screenWidth*0.02),
                    Text('Selected', style: TextStyle(
                      color: Colors.white, fontSize: screenWidth*0.037
                    ))
                  ],
                ),
              ],
            )
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            margin: EdgeInsets.only(top: screenWidth * 0.03),
            child: Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                top: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 8),
                      Text(
                        'Eclipse Cinema',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth*0.05),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth*0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date', style: TextStyle(
                            fontSize: screenWidth*0.037,
                            color: const Color.fromARGB(255, 87, 87, 87)
                          )),
                          SizedBox(height: 8),
                          SizedBox(
                            width: screenWidth * 0.17,
                            child: Text('25th May',
                              style: TextStyle(
                                fontSize: screenWidth * 0.038,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: screenWidth*0.13,
                        color: Colors.grey,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Time', style: TextStyle(
                            fontSize: screenWidth*0.037,
                            color: const Color.fromARGB(255, 87, 87, 87)
                          )),
                          SizedBox(height: 8),
                          SizedBox(
                            width: screenWidth * 0.15,
                            child: Text(widget.selectedTime,
                              style: TextStyle(
                                fontSize: screenWidth * 0.038,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: screenWidth*0.13,
                        color: Colors.grey,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Seat', style: TextStyle(
                            fontSize: screenWidth*0.037,
                            color: const Color.fromARGB(255, 87, 87, 87)
                          )),
                          SizedBox(height: 8),
                          SizedBox(
                            width: screenWidth * 0.15,
                            child: Text(
                              selectedSeats.isEmpty
                                  ? '-'
                                  : selectedSeats.length <= 1
                                      ? selectedSeats.join(', ')
                                      : '${selectedSeats.take(1).join(', ')}, ...',
                              style: TextStyle(
                                fontSize: screenWidth * 0.038,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: screenWidth*0.13,
                        color: Colors.grey,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Studio', style: TextStyle(
                            fontSize: screenWidth*0.037,
                            color: const Color.fromARGB(255, 87, 87, 87)
                          )),
                          SizedBox(height: 8),
                          SizedBox(
                            width: screenWidth * 0.15,
                            child: Text('Studio 1',
                              style: TextStyle(
                                fontSize: screenWidth * 0.038,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth*0.06),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Price', style: TextStyle(
                            fontSize: screenWidth*0.038,
                            color: const Color.fromARGB(255, 87, 87, 87)
                          )),
                      Text(selectedSeats.isEmpty? '-' : 'Rp ${seatPrice*selectedSeats.length}', style: TextStyle(
                        fontSize: screenWidth*0.07,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                  SizedBox(height: screenWidth*0.05),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: screenWidth,
        height: screenWidth*0.15,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: selectedSeats.isEmpty? Colors.grey : Color(0xFF7B1113),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero), 
        ),
          onPressed: selectedSeats.isEmpty? null : (){Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSummary(seat: selectedSeats, price: seatPrice, time: widget.selectedTime,)));},
          child: Text('Pay Now', style: TextStyle(
            color: selectedSeats.isEmpty?  Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth*0.05
          ),),
        ),
      ),
    );
  }
}

class ScreenCurve extends StatelessWidget {
  final double width;
  final double height;

  const ScreenCurve({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: ScreenPainter(),
      child: Center(
        child: Text(
          'Screen',
          style: TextStyle(fontSize: width * 0.08, color: Colors.white),
        ),
      ),
    );
  }
}

class ScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Path path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width / 2, size.height*2, size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}