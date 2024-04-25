import 'package:easy_localization/easy_localization.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataState.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class myProfile extends StatelessWidget {
  const myProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var datacubit = BlocProvider.of<DataCubit>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: secondColor,
        title: Text(
          "Profile".tr(),
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer<DataCubit, DataState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 1000,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                color: mianColor,
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundColor: secondColor,
                              radius: 32,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    datacubit!.userData!.profileImage!),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                datacubit!.userData!.fullname!,
                                style: TextStyle(
                                    color: secondColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              

                              Text("Programmer".tr() , style: TextStyle(color: Colors.grey),),
                         
                             
                        ]),
                          SizedBox(
                            width: 100,
                          ),
                          Row(children: [
                            Icon(
                            Icons.add_circle_outline,
                            size: 30,
                            color: secondColor,
                          ),
                          SizedBox(width: 5,),

                          Icon(
                            Icons.edit_rounded,
                            size: 30,
                            color: secondColor,
                          ),
                          ],)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Divider(
                      color: secondColor,
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            minWidth: 170,
                            color: secondColor,
                            onPressed: () {},
                            child: Text(
                              "Post".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 10,),
                          MaterialButton(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            minWidth: 170,
                            color: secondColor,
                            onPressed: () {},
                            child: Text(
                              "Chat Me".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 600,
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.6 / 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return personCard(
                              inxex: index,
                            );
                          }),
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
                width: 25,
                color: secondColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                datacubit.workers[inxex].place!,
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
                onPressed: () {},
                child: Text(
                  "Chat Me".tr(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {},
                child: Text(
                  "Whatsapp".tr(),
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
