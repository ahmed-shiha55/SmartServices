import 'package:easy_localization/easy_localization.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
class NationalID extends StatelessWidget {
  const NationalID({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        title: Text("Verify".tr() , style: TextStyle(color: Colors.white , fontSize: 22 , fontWeight: FontWeight.bold),),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20 , horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('asset/splashh.jpg' , height: 300,)),
            Text("Upload Your National ID" .tr() , style: TextStyle(color: secondColor , fontSize: 18 , fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            
            Text("Please upload your id to verify your account".tr() , style: TextStyle(color: Colors.grey , fontSize: 14 , ),),
            SizedBox(height: 20,),
            
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
                              "Upload ID Images".tr(),
                              style: TextStyle(
                                  color: secondColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
        
                    SizedBox(height: 30,),
        
                     Center(
                       child: MaterialButton(
                        onPressed: () {
                          
                        },
                        color: secondColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 160),
                        child: Text(
                                "Add".tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                                           ),
                     ),
        
          ],
        ),
      ),
    );
  }
}