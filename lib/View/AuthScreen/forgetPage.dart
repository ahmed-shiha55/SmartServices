import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finialproject/View/AuthScreen/loginPage.dart';
import 'package:finialproject/Conotrller/cubit/Auth/authCubit.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 24,
              color: secondColor,
            )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              color: mianColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.h),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Reover Password".tr(),
                            style: TextStyle(
                                color: secondColor,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Center(
                          child: Text(
                            "we will send a link to your email".tr(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'asset/password.jpg',
                        width: 230.w,
                        height: 240.h,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 9.w),
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: TextField(
                      onChanged: (value) {
                        authCubit.emailAddress = value;
                      },
                      controller: email,
                      decoration: InputDecoration(
                        fillColor: Colors.amber,
                        contentPadding: EdgeInsets.all(11),
                        hintText: "Email".tr(),
                        hintStyle: TextStyle(color: secondColor),
                        prefixIcon: Icon(
                          Icons.email,
                          color: secondColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MaterialButton(
                    minWidth: 330.w,
                    padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 80.h),
                    onPressed: () async {
                      await authCubit.resetPasswordWithLink();
                    },
                    color: secondColor,
                    child: Text(
                      "Send".tr(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn’t receive any email?".tr(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () async {
                          await authCubit.resetPasswordWithLink();
                        },
                        child: Text(
                          "Resend Again".tr(),
                          style: TextStyle(color: secondColor),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
