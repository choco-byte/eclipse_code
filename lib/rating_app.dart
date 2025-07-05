import 'package:flutter/material.dart';

class RatingPopup extends StatefulWidget {
  const RatingPopup({
    Key? key,
  }) : super(key: key);

  @override
  _RatingPopupState createState() => _RatingPopupState();
}

class _RatingPopupState extends State<RatingPopup> {
  double _currentRating = 3.0;
  String _tooltipMessage = 'Good';
  TextEditingController _commentController = TextEditingController();
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  final Map<double, String> _ratingMessages = {
    1.0: 'Terrible!',
    2.0: 'Bad',
    3.0: 'Good',
    4.0: 'Great!',
    5.0: 'Excellent!',
  };

  @override
  void dispose() {
    _commentController.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  Future<void> _submitRating() async {
    _isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));

    String comment = _commentController.text;
    print('User rated: $_currentRating');
    print('User comment: $comment');

    _isLoading.value = false;

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Thank you for rating and commenting on Eclipse!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryEclipseColor = Color(0xFF7B1113);
    final Color accentEclipseColor = primaryEclipseColor;
    final Color filledStarColor = Colors.orange;
    final Color emptyStarColor = Colors.grey.shade400;

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      contentPadding: EdgeInsets.zero, 
      insetPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      content: Stack(
        clipBehavior: Clip.none, 
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24.0, 45.0, 24.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ValueListenableBuilder<bool>(
                  valueListenable: _isLoading,
                  builder: (context, isLoading, child) {
                    if (isLoading) {
                      return Container(
                        height: 150,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(
                              color: primaryEclipseColor,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Submitting your rating...',
                              style: TextStyle(color: primaryEclipseColor, fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rate your experience with Eclipse',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryEclipseColor,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(width: 8),
                              Tooltip(
                                message: 'Rate your experience from 1 (Terrible) to 5 (Excellent). Your feedback helps us improve!',
                                decoration: BoxDecoration(
                                  color: primaryEclipseColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: Colors.white, width: 1.0),
                                ),
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                                waitDuration: Duration(milliseconds: 500),
                                showDuration: Duration(seconds: 3),
                                child: Icon(
                                  Icons.info_outline,
                                  color: primaryEclipseColor.withOpacity(0.7),
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            _tooltipMessage,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: primaryEclipseColor,
                            ),
                          ),
                          SizedBox(height: 20),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: primaryEclipseColor,
                              inactiveTrackColor: primaryEclipseColor.withOpacity(0.3),
                              thumbColor: primaryEclipseColor,
                              valueIndicatorColor: primaryEclipseColor,
                              overlayColor: primaryEclipseColor.withOpacity(0.2),
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                              valueIndicatorTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              showValueIndicator: ShowValueIndicator.always,
                              trackHeight: 8.0,
                              activeTickMarkColor: Colors.white,
                              inactiveTickMarkColor: Colors.white,
                            ),
                            child: Slider(
                              value: _currentRating,
                              min: 1.0,
                              max: 5.0,
                              divisions: 4,
                              label: _currentRating.round().toString(),
                              onChanged: (double newValue) {
                                setState(() {
                                  _currentRating = newValue;
                                  _tooltipMessage = _ratingMessages[newValue] ?? '';
                                });
                              },
                              onChangeStart: (double startValue) {
                                print('Slider started at: $startValue');
                              },
                              onChangeEnd: (double endValue) {
                                print('Slider ended at: $endValue');
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(5, (index) {
                              final int starNumber = index + 1;
                              return Icon(
                                starNumber <= _currentRating.round() ? Icons.star : Icons.star_border,
                                color: starNumber <= _currentRating.round() ? filledStarColor : emptyStarColor,
                                size: 28.0,
                              );
                            }),
                          ),
                          SizedBox(height: 25), 
                          TextField(
                            controller: _commentController,
                            maxLines: 4,
                            maxLength: 250,
                            decoration: InputDecoration(
                              hintText: 'Share your thoughts about Eclipse...',
                              labelText: 'Comments (Optional)',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                color: primaryEclipseColor.withOpacity(0.8),
                              ),
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: primaryEclipseColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: accentEclipseColor, width: 2.0),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: isLoading ? null : _submitRating,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryEclipseColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                ),
                                child: isLoading
                                    ? SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        'Submit Rating',
                                        style: TextStyle(color: Colors.white, fontSize: 18),
                                      ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 0, 
            right: 0, 
            child: CircleAvatar( 
              radius: 18, 
              backgroundColor: Colors.white, 
              child: IconButton(
                icon: Icon(Icons.close),
                color: primaryEclipseColor, 
                iconSize: 22, 
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: 'Close',
              ),
            ),
          ),
        ],
      ),
    );
  }
}