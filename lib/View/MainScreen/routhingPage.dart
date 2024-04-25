// import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
// import 'package:finialproject/View/MainScreen/bottomnav.dart';
// import 'package:finialproject/View/MainScreen/bottomnav2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class RothingPage extends StatefulWidget {
//   const RothingPage({super.key});
  

//   @override
//   State<RothingPage> createState() => _RothingPageState();

// }

// class _RothingPageState extends State<RothingPage> {
//   @override
//   void initState() {
//      var datacubit = BlocProvider.of<DataCubit>(context);
//     // TODO: implement initState
//     super.initState();
//     datacubit.getMyData();
//   }
//   Widget build(BuildContext context)  {
   
//      var datacubit = BlocProvider.of<DataCubit>(context);
   
//     return datacubit.userData!.personType =='Worker'? BottomNAv2():BottomNAv();
//   }
// }