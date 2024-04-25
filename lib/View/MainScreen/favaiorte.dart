import 'package:easy_localization/easy_localization.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/View/MainScreen/bottomnav.dart';
import 'package:finialproject/View/MainScreen/souq.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Faviorte extends StatelessWidget {
  const Faviorte({super.key});

  @override
  Widget build(BuildContext context) {
    var datacubit = BlocProvider.of<DataCubit>(context);
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
          "Favorite".tr(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 600,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.29 / 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: datacubit.faviorteList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return personCard(
                      index: index,
                    );
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}

class personCard extends StatelessWidget {
  int index;
  personCard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var datacubit = BlocProvider.of<DataCubit>(context);
    return Container(
      // padding: EdgeInsets.all(6),
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
          Image.network('${datacubit.faviorteList[index].image}'),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      datacubit.faviorteList[index].title.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          datacubit.removeFaviorte(
                              id: datacubit.products[index].uid.toString());
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 22,
                          color: secondColor,
                        ))
                  ],
                ),
                SizedBox(
                  height: 5,
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
                      datacubit.faviorteList[index].place.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${datacubit.faviorteList[index].price} EGP",
                  style: TextStyle(
                      color: secondColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '12/12/1986',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
