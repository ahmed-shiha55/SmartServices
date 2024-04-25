import 'package:flutter/material.dart';
import 'package:finialproject/constant/id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataState.dart';
import 'package:finialproject/View/MainScreen/CatgoriesWorkers.dart';

class Catogry extends StatelessWidget {
  Catogry({super.key});

  @override
  Widget build(BuildContext context) {
    var datacubit = BlocProvider.of<DataCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mianColor,
        title: Text(
          "Categories".tr(),
          style: TextStyle(color: Color(0xFF8092F4)),
        ),
      ),
      body: BlocConsumer<DataCubit, DataState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              color: mianColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.8 / 2,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: datacubit.catgories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CatgoriesWorkers()),
                          );

                          datacubit.getWorkers(
                              name: datacubit.catgories[index].name);
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(0.5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: secondColor,
                                    width: 2.0,
                                  ),
                                  color: secondColor),
                              child: Image.network(
                                datacubit.catgories[0].image!,
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              datacubit.catgories[index].name!,
                              style: isDark
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: secondColor),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            );
          }),
    );
  }
}
