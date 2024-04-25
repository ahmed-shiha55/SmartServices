import 'package:finialproject/constant/colors.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: mianColor,
        title: Text(
          'Notifications',
          style: TextStyle(color: secondColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.rowing,
            color: secondColor,
            size: 26,
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: mianColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'asset/splash.jpg',
              width: 130,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'No Notification',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'we will notify you when somthing happend',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
