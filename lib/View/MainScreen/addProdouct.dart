import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataState.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var datacubit = BlocProvider.of<DataCubit>(context);
    return Scaffold(
      backgroundColor: mianColor,
      appBar: AppBar(
        backgroundColor: mianColor,
        title: Text(
          "Add Product".tr(),
          style: TextStyle(
              color: secondColor, fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: BlocConsumer<DataCubit, DataState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  DottedBorder(
                    padding: EdgeInsets.all(120),
                    borderPadding: EdgeInsets.all(30),
                    dashPattern: [13, 13, 2, 3],
                    color: secondColor,
                    strokeWidth: 3,
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.category,
                            size: 30,
                            color: secondColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Choose Images'.tr(),
                            style: TextStyle(
                                color: secondColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: secondColor,
                    ),
                    child: TextFormField(
                      onChanged: (title) {
                        datacubit.title1 = title;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'title'.tr(),
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 50),
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: secondColor,
                    ),
                    child: TextFormField(
                      onChanged: (des) {
                        datacubit.des1 = des;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Description'.tr(),
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: secondColor,
                    ),
                    child: TextFormField(
                      onChanged: (price) {
                        datacubit.price1 = price;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Price'.tr(),
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: secondColor,
                    ),
                    child: TextFormField(
                      onChanged: (place) {
                        datacubit.place1 = place;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Place'.tr(),
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {
                      datacubit.uploadProduct();
                    },
                    color: secondColor,
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 160),
                    child: state is UploadPostLoading
                        ? CircularProgressIndicator(color: Colors.white,)
                        : Text(
                            "Add".tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
