import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:finialproject/constant/id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finialproject/Model/workers.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finialproject/View/ChatScreen/messenger.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataState.dart';

class CatgoriesWorkers extends StatelessWidget {
  const CatgoriesWorkers({super.key});

  @override
  Widget build(BuildContext context) {
    var datacubit = BlocProvider.of<DataCubit>(context);
    return Scaffold(
      backgroundColor: mianColor,
      appBar: AppBar(
        title: Text(
          "Workers on Programmer".tr(),
          style: TextStyle(
              color: secondColor, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: mianColor,
      ),
      body: BlocConsumer<DataCubit, DataState>(
          listener: (context, state) {},
          builder: (context, state) {
            return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: datacubit.workers.length,
                itemBuilder: (BuildContext context, int index) {
                  return personCard(inxex: index);
                });
          }),
    );
  }
}

class personCard extends StatelessWidget {
  int inxex;
  personCard({required this.inxex, super.key});

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
            datacubit.workers[inxex].image!,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            datacubit.workers[inxex].title!,
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
                width: 20.w,
                color: secondColor,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                datacubit.workers[inxex].place!,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            datacubit.workers[inxex].price!,
            style: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: secondColor,
                child: CircleAvatar(
                  radius: 13,
                  backgroundImage:
                      NetworkImage(datacubit.workers[inxex].image!),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Abo Aboyda',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                color: secondColor,
                padding: EdgeInsets.all(5),
                minWidth: 20,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Messanger(
                              reciverID: datacubit.workers[inxex].id!,
                            )),
                  );
                },
                child: Text(
                  'Chat Me ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              MaterialButton(
                minWidth: 20,
                color: Colors.green,
                padding: EdgeInsets.all(5),
                onPressed: () {
                  print("lllll");
                  print("${datacubit.workers[inxex].id!}");
                  print(userID);
                  print(FirebaseAuth.instance.currentUser!.uid);
                  print("qqqq");
                  // print("${WorkersModel}");
                },
                child: Text(
                  'Whatsapp',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
