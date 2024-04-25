import 'package:finialproject/View/WelcomeScreen/onboardingPage.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:finialproject/constant/id.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboradingPAge()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: mianColor,
      child: Center(
        child: isDark? Image.asset(
                              'asset/lightLogo.png',
                              width: 250.w,
                              height: 250.h,
                            ) : Image.asset(
                              'asset/logo.png',
                              width: 250.w,
                              height: 250.h,
                            ),
      ),
    ));
  }
}
