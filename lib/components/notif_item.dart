import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final Color iconBackgroundColor;
  final VoidCallback? onTap;
  final bool isRead;

  const NotificationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
    required this.iconBackgroundColor,
    this.onTap,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget itemContent = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Stack(
            children: [
              
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              
              if (!isRead) 
                Positioned(
                  right: 0, 
                  top: 0,   
                  child: Container(
                    width: 10.0, 
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFE11F22), 
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.0), 
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16.0), 

          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: isRead ? Colors.grey[700] : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    
    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: itemContent,
      );
    }
    return itemContent;
  }
}