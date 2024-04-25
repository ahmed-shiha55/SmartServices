import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finialproject/constant/snackbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finialproject/View/AuthScreen/loginPage.dart';
import 'package:finialproject/View/MainScreen/nationalId.dart';
import 'package:finialproject/Conotrller/cubit/Auth/authCubit.dart';
import 'package:finialproject/Conotrller/cubit/Auth/cubitState.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Rigister extends StatefulWidget {
  const Rigister({super.key});

  @override
  State<Rigister> createState() => _RigisterState();
}

class _RigisterState extends State<Rigister> {
  final List<String> type = [
    'Worker',
    'Customer',
  ];
  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    final _key = GlobalKey<FormState>();

    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            //appBar: AppBar(),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Form(
                    key: _key,
                    child: Container(
                      color: mianColor,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: secondColor,
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: secondColor,
                                  radius: 55.h,
                                  child: CircleAvatar(
                                    radius: 54.h,
                                    backgroundImage:
                                        AssetImage('asset/abo.jpg'),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  //margin: EdgeInsets.all(4),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: secondColor,
                                  ),
                                  child: Container(
                                    width: 35.w,
                                    height: 32.h,
                                    child: IconButton(
                                        onPressed: () async {
                                          await showmodel(
                                              context: context,
                                              authCubit: authCubit);
                                        },
                                        icon: Icon(
                                          Icons.camera_alt_outlined,
                                          size: 18.h,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Get On Board!".tr(),
                                style: TextStyle(
                                    color: secondColor,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "Create your profile to start your jounary"
                                    .tr(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Container(
                            height: 64.h,
                            margin: EdgeInsets.symmetric(horizontal: 15.dg),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DropdownButtonFormField2<String>(
                                    value: authCubit.type,
                                    isExpanded: false,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 3),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    hint: Text(
                                      'Select Your Job',
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.white),
                                    ),
                                    items: type
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please Select a Type';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        authCubit.type = value;
                                      });
                                    },
                                    onSaved: (value) {
                                      authCubit.type = value;
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      padding: EdgeInsets.only(right: 8),
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.white,
                                      ),
                                      iconSize: 24,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 6),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              style: TextStyle(color: secondColor),
                              onChanged: (name) {
                                authCubit.fullName = name;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(9),
                                fillColor: Colors.amber,
                                hintText: "Full Name",
                                hintStyle:
                                    TextStyle(color: secondColor, fontSize: 15),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: secondColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length > 3) {
                                  null;
                                } else {
                                  return 'Please Enter Right name';
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 6),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.contains(RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                                  null;
                                } else {
                                  return 'Please Enter Right Email';
                                }
                                return null;
                              },
                              style: TextStyle(color: secondColor),
                              onChanged: (email) {
                                authCubit.emailAddress = email;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.amber,
                                contentPadding: EdgeInsets.all(9),
                                hintText: "Email".tr(),
                                hintStyle:
                                    TextStyle(color: secondColor, fontSize: 15),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: secondColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 6),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              obscureText: authCubit.obscurePasswordTextValue!,
                              validator: (value) {
                                if (value!.length >= 6 && value!.length <= 14) {
                                } else {
                                  return "Wrong Password";
                                }
                              },
                              style: TextStyle(color: secondColor),
                              onChanged: (password) {
                                authCubit.password = password;
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    authCubit.obscurePasswordTextValue!
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: secondColor,
                                  ),
                                  onPressed: () {
                                    authCubit.obscurePasswordText();
                                  },
                                ),
                                fillColor: Colors.amber,
                                contentPadding: EdgeInsets.all(9),
                                hintText: "Password".tr(),
                                hintStyle:
                                    TextStyle(color: secondColor, fontSize: 15),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: secondColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 6),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.contains(RegExp(r"^0\d{10}$"))) {
                                } else {
                                  return "Please enter right phone number";
                                }
                              },
                              style: TextStyle(color: secondColor),
                              onChanged: (phone) {
                                authCubit.phone = phone;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(9),
                                fillColor: Colors.amber,
                                hintText: "Phone".tr(),
                                hintStyle:
                                    TextStyle(color: secondColor, fontSize: 15),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: secondColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          authCubit.type == "Customer"
                              ? SizedBox()
                              : Container(
                                  margin: EdgeInsets.symmetric(vertical: 6),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextFormField(
                                    style: TextStyle(color: secondColor),
                                    onChanged: (job) {
                                      authCubit.job = job;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.amber,
                                      hintText: "Job".tr(),
                                      hintStyle: TextStyle(color: secondColor),
                                      prefixIcon: Icon(
                                        Icons.work,
                                        color: secondColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                activeColor: secondColor,
                                value: authCubit.termsAndConditionCheckBoxValue,
                                onChanged: (value) {
                                  authCubit.updateTermsAndConditionCheckBox(
                                      newValue: value);
                                },
                              ),
                              Text(
                                "By checking the box you agree to our Terms and Conditions."
                                    .tr(),
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 10),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          MaterialButton(
                            minWidth: 300.h,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            onPressed: () async {
                              if (_key.currentState!.validate()) {
                                await authCubit.signUpWithEmailAndPassword();
                                if (authCubit.type == 'Worker') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NationalID()),
                                  );
                                } else {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                }
                              }
                            },
                            color: secondColor,
                            child: Text(
                              "Sign Up".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Or".tr(),
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 330.w,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: secondColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'asset/red.svg',
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Sign Up with Google".tr(),
                                  style: TextStyle(color: secondColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already a member?".tr(),
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                },
                                child: Text(
                                  "Log In".tr(),
                                  style: TextStyle(color: secondColor),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

showmodel({required context, required authCubit}) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(22),
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await authCubit.uploadImage2Screen(ImageSource.camera);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.camera,
                    size: 30,
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Text(
                    "From Camera",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
            GestureDetector(
              onTap: () async {
                await authCubit.uploadImage2Screen(ImageSource.gallery);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.photo_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Text(
                    "From Gallery",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
