import 'package:easy_localization/easy_localization.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataState.dart';
import 'package:finialproject/Conotrller/cubit/Theme/layout_cubit.dart';
import 'package:finialproject/Conotrller/cubit/Theme/layout_states..dart';
import 'package:finialproject/Model/userModel.dart';
import 'package:finialproject/View/AuthScreen/loginPage.dart';
import 'package:finialproject/View/MainScreen/myProfile.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:finialproject/constant/id.dart';
import 'package:finialproject/constant/network.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var datacubit = BlocProvider.of<DataCubit>(context);
    

    return Scaffold(
      backgroundColor: mianColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mianColor,
        actions: [
          Icon(
            Icons.settings,
            color: secondColor,
            size: 30,
          )
        ],
        title: Text(
          "Profile".tr(),
          style: TextStyle(
              color: secondColor, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer<DataCubit, DataState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(15),
                color: mianColor,
                child: Center(
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            color: secondColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: CircleAvatar(
                            backgroundColor: secondColor,
                            radius: 64,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  datacubit!.userData!.profileImage! ?? ''),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        datacubit!.userData!.fullname! ?? 'Hello',
                        style: TextStyle(
                            color: secondColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        datacubit.userData!.email!,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(
                        color: secondColor,
                      ),
                      datacubit.userData!.personType == 'Worker'
                          ? buildProfileItem(
                              "My Posts".tr(), Icons.account_balance_wallet, () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => myProfile()),
                              );
                            })
                          : SizedBox(),
                      buildProfileItem("Edit Profile".tr(), Icons.edit, () {
                        // Add your logic for editing profile
                      }),
                      buildProfileItem("Favorite Services".tr(), Icons.favorite, () {
                        // Add your logic for favorite services
                      }),
                      buildProfileItem("Change Password".tr(), Icons.lock, () {
                        // Add your logic for changing password
                      }),
                      Divider(
                        color: secondColor,
                      ),
                      buildProfileItem("Privacy Policy".tr(), Icons.security, () {
                        // Add your logic for privacy policy
                      }),
                      buildProfileItem("About the App".tr(), Icons.info, () {
                        // Add your logic for about the app
                      }),
                     
                      buildProfileItem("Terms and Conditions".tr(), Icons.assignment,
                          () {
                        // Add your logic for terms and conditions
                      }),
                      buildProfileItem("Help".tr(), Icons.help, () {
                        // Add your logic for help
                      }),
                  
                      Divider(
                        color: secondColor,
                      ),

                      buildProfileItem("Log Out".tr(), Icons.exit_to_app, () async {
                        await FirebaseAuth.instance.signOut();
                        await CacheHelper.deleteCacheData(key: 'uid');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      }),
                      Divider(
                        color: secondColor,
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              color: secondColor,
                              onPressed: () async {
                                await context.setLocale(Locale('ar', 'SA'));
                              },
                              child: Text("Arabic" , style: TextStyle(color: Colors.white),),
                            ),
                            
                            MaterialButton(
                              color: secondColor,

                              onPressed: () async {
                                await context.setLocale(Locale('en', 'US'));
                              },
                              child: Text("English", style: TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

Widget buildProfileItem(String title, IconData icon, VoidCallback onTap) {
  return ListTile(
    title: Text(
      title,
      style: isDark
          ? TextStyle(color: Colors.white)
          : TextStyle(color: secondColor),
    ),
    leading: Icon(
      icon,
      color: secondColor,
    ),
    onTap: onTap,
    trailing: Icon(
      Icons.arrow_back_outlined,
      color: secondColor,
      size: 14,
    ),
  );
}
