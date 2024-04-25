import 'package:easy_localization/easy_localization.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Subcatgories extends StatelessWidget {
  const Subcatgories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Programmer".tr(),
          style: TextStyle(
              fontSize: 26, color: secondColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: mianColor,
      ),
      backgroundColor: mianColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: textfiled,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                            size: 30,
                          ), // Start icon
                          // End icon
                          hintText: "Enter your text here".tr(),
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                          ), // Placeholder text

                          // Border around the TextField
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Services".tr(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 600,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.14 / 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return personCard();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class personCard extends StatelessWidget {
  const personCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: textfiled),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'asset/abo.jpg',
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Programmer".tr(),
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SvgPicture.asset('asset/locaiton.svg' ,width: 25 , color: secondColor,),
              SizedBox(
                width: 5,
              ),
              Text(
                'Not Avaliable',
                style: TextStyle(color: Colors.grey),
              ),
             
            ],
          ),
           SizedBox(
                height: 5,
              ),
              Text(
                "400 EGP",
                style: TextStyle(
                    color: secondColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
        
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('asset/abo.jpg'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Abo Aboyda',
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  SizedBox(
                    height: 5,
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
          SizedBox(height: 10,),
           Text(
                "27/2/2009",
                style: TextStyle(
                    color: secondColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
        ],
      ),
    );
  }
}
