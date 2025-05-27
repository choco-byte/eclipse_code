import 'package:flutter/material.dart';

class NotificationData {
  final String id; 
  final IconData icon;
  final String title;
  final String time;
  final Color iconBackgroundColor;
  bool isRead; 
  NotificationData({
    required this.id,
    required this.icon,
    required this.title,
    required this.time,
    required this.iconBackgroundColor,
    this.isRead = false, 
  });

  
  NotificationData copyWith({bool? isRead}) {
    return NotificationData(
      id: id,
      icon: icon,
      title: title,
      time: time,
      iconBackgroundColor: iconBackgroundColor,
      isRead: isRead ?? this.isRead, 
    );
  }
}