import 'package:finialproject/View/MainScreen/message.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:flutter/material.dart';


import 'package:intl/intl.dart';

class ChatWidgetSend extends StatelessWidget {
  final Messages message;

  ChatWidgetSend({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        padding: EdgeInsets.only(left: 10, bottom: 15, top: 15, right: 12),
        decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start

          children: [
            Text(
              message.content,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 7),
            Text(
              '${DateFormat('hh:mm a').format(message.createdAt)}', // Format the time
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatWidgetRecieve extends StatelessWidget {
  final Messages message;

  ChatWidgetRecieve({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        padding: EdgeInsets.only(left: 12, bottom: 15, top: 15, right: 10),
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // Align items to the start

          children: [
            Text(
              message.content,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 7),
            Text(
              '${DateFormat('hh:mm a').format(message.createdAt)}', // Format the time
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
