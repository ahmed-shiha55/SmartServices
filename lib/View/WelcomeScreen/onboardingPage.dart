import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finialproject/View/AuthScreen/loginPage.dart';
import 'package:finialproject/View/AuthScreen/reigister.dart';

class OnboradingPAge extends StatelessWidget {
  const OnboradingPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20.w),
          color: mianColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Text(
                "Welcome".tr(),
                style: TextStyle(
                  color: secondColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "You are in the best place for find jobs".tr(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                  child: Image.asset(
                'asset/onboarding.jpg',
                width: 300.w,
                height: 350.h,
              )),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    print("fffff");
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 80.w),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Log In".tr(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Rigister()),
                    );
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 80.w),
                    decoration: BoxDecoration(
                      color: thridColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Sign Up".tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
