import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:finialproject/constant/id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:finialproject/constant/network.dart';
import 'package:finialproject/View/MainScreen/souq.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finialproject/View/MainScreen/profile.dart';
import 'package:finialproject/View/AuthScreen/loginPage.dart';
import 'package:finialproject/View/ChatScreen/messenger.dart';
import 'package:finialproject/View/MainScreen/favaiorte.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:finialproject/Conotrller/cubit/Auth/authCubit.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataState.dart';
import 'package:finialproject/Conotrller/cubit/Theme/layout_cubit.dart';
import 'package:finialproject/Conotrller/cubit/Theme/layout_states..dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController contollers = PageController();

  @override
  Widget build(BuildContext context) {
    var datacubit = BlocProvider.of<DataCubit>(context);
    final cubit = LayoutCubit.getInstance(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: mianColor,
        title: isDark
            ? Image.asset(
                'asset/lightLogo.png',
                width: 100,
                height: 200,
              )
            : Image.asset(
                'asset/logo.png',
                width: 200,
                height: 200,
              ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: secondColor),
                child: Center(
                  child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Faviorte()),
                        );
                      },
                      icon: Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                        size: 18,
                      )),
                ),
              ),
              SizedBox(
                width: 5,
              ),

              BlocConsumer<LayoutCubit, LayoutStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Switch(
                        activeColor: secondColor,
                        value: isDark,
                        onChanged: (newValue) {
                          cubit.changeAppTheme(newValue: newValue);
                        });
                  }),
              // Container(
              //   margin: EdgeInsets.only(right: 10),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(25), color: secondColor),
              //   child: IconButton(
              //       onPressed: () {

              //       },
              //       icon:
              //           Icon(Icons.card_travel, color: Colors.white, size: 26)),
              // )
            ],
          ),
        ],
      ),
      body: BlocConsumer<DataCubit, DataState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: mianColor,
                child: Column(
                  children: [
                    // buildProfileItem("Log Out".tr(), Icons.exit_to_app,
                    //     () async {
                    //   await FirebaseAuth.instance.signOut();
                    //   await CacheHelper.deleteCacheData(key: 'uid');
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => Login()),
                    //   );
                    // }),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 29,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: secondColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Center(
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            datacubit.searchAboutworker(
                                                input: value);
                                          });
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            CupertinoIcons.compass,
                                            color: Colors.white,
                                            size: 28,
                                          ), // Start icon
                                          suffixIcon: Icon(
                                            CupertinoIcons.location,
                                            color: Colors.white,
                                            size: 28,
                                          ), // End icon
                                          hintText: "Enter your text here".tr(),
                                          hintStyle: TextStyle(
                                            color: Colors.white,
                                          ), // Placeholder text

                                          // Border around the TextField
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        Container(
                          height: 50.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: secondColor,
                          ),
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: PageView(
                        controller: contollers,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Image.asset(
                              'asset/1st.jpg',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Image.asset(
                              'asset/join.jpg',
                              width: 200,
                              height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: contollers,
                      count: 2,
                      effect: SlideEffect(
                          dotHeight: 8,
                          dotWidth: 9,
                          activeDotColor: secondColor),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          onPressed: () {},
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Services".tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          color: secondColor,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        MaterialButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Souq()),
                            );
                          },
                          child: isDark
                              ? Text(
                                  "Souq".tr(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                )
                              : Text(
                                  "Souq".tr(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                          color: isDark ? Colors.white : thridColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'asset/find.png',
                      width: double.infinity,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories".tr(),
                          style: isDark
                              ? TextStyle(color: Colors.white, fontSize: 20)
                              : TextStyle(color: secondColor, fontSize: 20),
                        ),
                        Text(
                          "View all".tr(),
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: datacubit.catgories.length,
                        itemBuilder: (context, int index) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: secondColor,
                                ),
                                child: Image.network(
                                  datacubit.catgories[0].image!,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                datacubit.catgories[index].name!,
                                style: isDark
                                    ? TextStyle(
                                        color: Colors.white, fontSize: 14)
                                    : TextStyle(
                                        color: secondColor, fontSize: 14),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          datacubit.workersFiltered.isEmpty
                              ? "Programmer".tr()
                              : "Services".tr(),
                          style: isDark
                              ? TextStyle(color: Colors.white, fontSize: 20)
                              : TextStyle(color: secondColor, fontSize: 20),
                        ),
                        Text(
                          "View all".tr(),
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 600,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2 / 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: datacubit.workersFiltered.isEmpty
                            ? datacubit.workers.length
                            : datacubit.workersFiltered.length,
                        itemBuilder: (BuildContext context, int index) {
                          return datacubit.workersFiltered.isEmpty
                              ? personCard(
                                  inxex: index,
                                  workerEmpty: 'True',
                                  userId:
                                      datacubit.users[index].userID.toString(),
                                )
                              : personCard(
                                  inxex: index,
                                  workerEmpty: 'False',
                                  userId:
                                      datacubit.users[index].userID.toString(),
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class personCard extends StatelessWidget {
  int inxex;
  String? workerEmpty;
  String userId;
  personCard(
      {required this.inxex,
      required this.userId,
      required this.workerEmpty,
      super.key});

  @override
  Widget build(BuildContext context) {
    var datacubit = BlocProvider.of<DataCubit>(context);
    return Container(
      padding: EdgeInsets.all(6),
      width: 200,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: secondColor.withOpacity(0.2), // Shadow color
            spreadRadius: 3, // Spread radius
            blurRadius: 4, // Blur radius
            offset: Offset(0, 1), // Offset from the box
          ),
        ],
        border: Border.all(color: secondColor, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            workerEmpty == 'True'
                ? datacubit.workers[inxex].image!
                : datacubit.workersFiltered[inxex].image!,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            workerEmpty == 'True'
                ? datacubit.workers[inxex].title!
                : datacubit.workersFiltered[inxex].title!,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'asset/locaiton.svg',
                width: 25,
                color: secondColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                workerEmpty == 'True'
                    ? datacubit.workers[inxex].place!
                    : datacubit.workersFiltered[inxex].place!,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            datacubit.workers[inxex].price!,
            style: TextStyle(
                color: secondColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: secondColor,
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      NetworkImage(datacubit.workers[inxex].image!),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Abo Aboyda',
                    style: TextStyle(color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                color: secondColor,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Messanger(
                              reciverID:
                                  datacubit.users[inxex].userID.toString(),
                            )),
                  );
                },
                child: Text(
                  'Chat me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {},
                child: Text(
                  'Whatsapp',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
