import 'package:easy_localization/easy_localization.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/Model/productModel.dart';
import 'package:finialproject/View/MainScreen/addProdouct.dart';
import 'package:finialproject/View/MainScreen/bottomnav.dart';
import 'package:finialproject/View/MainScreen/detailsScreen.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Souq extends StatefulWidget {
  const Souq({super.key});

  @override
  State<Souq> createState() => _SouqState();
}

class _SouqState extends State<Souq> {
  @override
  Widget build(BuildContext context) {
    var datacubit = BlocProvider.of<DataCubit>(context);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: secondColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProduct()),
            );
          },
          tooltip: "Add Product".tr(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
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
          "Open Souq".tr(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  datacubit.searchAboutproduct(input: value);
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  CupertinoIcons.compass,
                                  color: Colors.white,
                                  size: 30,
                                ), // Start icon
                                suffixIcon: Icon(
                                  CupertinoIcons.location,
                                  color: Colors.white,
                                  size: 30,
                                ), // End icon
                                hintText: "Enter your text here".tr(),
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ), // Placeholder text

                                // Border around the TextField
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondColor,
                  ),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 600,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.25 / 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: datacubit.productFilter.isEmpty
                      ? datacubit.products.length
                      : datacubit.productFilter.length,
                  itemBuilder: (BuildContext context, int index) {
                    return datacubit.productFilter.isEmpty
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenDetails(
                                          index: index,
                                        )),
                              );
                            },
                            child: personCard(
                              index: index,
                              option: "True",
                            ))
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenDetails(
                                          index: index,
                                        )),
                              );
                            },
                            child: personCard(
                              index: index,
                              option: "False",
                            ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class personCard extends StatelessWidget {
  int index;
  String? option;
  personCard({required this.index, required this.option, super.key});

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
          Image.network(
              '${option == 'True' ? datacubit.products[index].image! : datacubit.productFilter[index].image!}'),
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
                      datacubit.products[index].title.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          datacubit.AddFaviorte(
                              Model: ProductModel(
                                  title: datacubit.products[index].title,
                                  image: datacubit.products[index].image,
                                  des: datacubit.products[index].des,
                                  place: datacubit.products[index].place,
                                  price: datacubit.products[index].price,
                                  uid: datacubit.products[index].uid));
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 20,
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
                      option == 'True'
                          ? datacubit.products[index].place!
                          : datacubit.productFilter[index].place!,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${option == 'True' ? datacubit.products[index].price! : datacubit.productFilter[index].price!}EGP",
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
