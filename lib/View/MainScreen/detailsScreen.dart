import 'package:easy_localization/easy_localization.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/View/MainScreen/bottomnav.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScreenDetails extends StatelessWidget {
  int index;
  ScreenDetails({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var datacubit = BlocProvider.of<DataCubit>(context);
    PageController contollers = PageController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNAv()),
            );
          },
          icon: Icon(Icons.arrow_back, size: 22, color: Colors.white),
        ),
        backgroundColor: secondColor,
        title: Text(
          "Details".tr(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 300,
                  child: PageView(
                    controller: contollers,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Image.network(datacubit.products[index].image.toString()),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Image.network(datacubit.products[index].image.toString()),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: contollers,
                  count: 2,
                  effect: SlideEffect(activeDotColor: secondColor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    datacubit.products[index].title.toString(),
                    style: TextStyle(
                        color: secondColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        datacubit.products[index].place.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price".tr(),
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${datacubit.products[index].price} EGP",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite_outline,
                        size: 34,
                        color: secondColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    datacubit.products[index].des.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: () {},
                      color: secondColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 160),
                      child: Text(
                        "Chat Me".tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
