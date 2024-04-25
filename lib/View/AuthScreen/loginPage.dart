import '../../constant/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finialproject/constant/snackbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finialproject/View/AuthScreen/reigister.dart';
import 'package:finialproject/View/MainScreen/bottomnav.dart';
import 'package:finialproject/View/AuthScreen/forgetPage.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/Conotrller/cubit/Auth/authCubit.dart';
import 'package:finialproject/Conotrller/cubit/Auth/cubitState.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
 

    // TextEditingController email = TextEditingController();
    // TextEditingController pass = TextEditingController();
    //final _key = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is SigninSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                           BottomNAv())) //customReplacementNavigate(context, "/homeNavBar")
              :
              //showToast("Please Verify Your Account");
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please Verify your email'),
                    backgroundColor: const Color.fromARGB(255, 25, 8, 6),
                  ),
                );
        } else if (state is SigninFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: const Color.fromARGB(255, 41, 10, 8),
            ),
          );
        }
              },
              builder: (context, state) {
                   var authCubit = BlocProvider.of<AuthCubit>(context);
    
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
                return Container(
                  color: mianColor,
                  child:  Column(
                    children: [
                      SizedBox(
                        height: 70.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Get Started".tr(),
                                style: TextStyle(
                                    color: secondColor,
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Center(
                              child: Text(
                                "by creating a free account.".tr(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Image.asset(
                            'asset/ws.jpg',
                            width: 240.w,
                            height: 170.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                      Form(
                       // key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                // controller: emailAddress,
                                
                                style: TextStyle(color: secondColor),
                                onChanged: (email) {
                                  authCubit.emailAddress = email;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(9),
                                  fillColor: Colors.amber,
                                  hintText: "Email".tr(),
                                  hintStyle: TextStyle(color: secondColor),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: secondColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.contains(RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                                    "";
                                  } else {
                                    return 'Please Enter Right Email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                          margin: EdgeInsets.symmetric(vertical: 9),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            obscureText: authCubit.obscurePasswordTextValue!,
                           
                            style: TextStyle(color: secondColor),
                            onChanged: (password) {
                              authCubit.password = password;
                            },
                            decoration: InputDecoration(
                              enabled: true,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  authCubit.obscurePasswordTextValue!
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: secondColor,
                                ),
                                onPressed: () {
                                  authCubit.obscurePasswordText();
                                },
                              ),
                              fillColor: Colors.amber,
                              contentPadding: EdgeInsets.all(9),
                              hintText: "Password".tr(),
                              hintStyle: TextStyle(color: secondColor),
                              prefixIcon: Icon(
                                Icons.password,
                                color: secondColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length >= 6 && value.length <= 14) {
                              } else {
                                return "Wrong Password";
                              }
                              return "";
                            },
                          ),
                        ),
                          ],
                        ),
                      ),
                      
                      Container(
                          margin: EdgeInsets.only(right: 20, bottom: 4),
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPage()),
                              );
                            },
                            child: Text(
                              "Forget Password?".tr(),
                              style:
                                  TextStyle(color: secondColor, fontSize: 12),
                            ),
                          )),
                      MaterialButton(
                        minWidth: 330.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 80.h),
                        onPressed: () async {
                           authCubit.sigInWithEmailAndPassword();
                           if (_formKey.currentState!.validate()) {
                            authCubit.sigInWithEmailAndPassword();
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ForgetPage()),
                            // );
                          }
                  
                          //   await authCubit.sigInWithEmailAndPassword();
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => BottomNAv()),
                          // );
                          //   if (_formKey.currentState!.validate()) {
                          //     await authCubit.sigInWithEmailAndPassword();
                          //    await datacubit.getMyData();
                  
                          //     if (FirebaseAuth
                          //         .instance.currentUser!.emailVerified) {
                          //        if (
                          //         await datacubit.userData!.personType ==
                          //            'Worker' ) {
                          //          Navigator.pushReplacement(
                          //            context,
                          //            MaterialPageRoute(
                          //                builder: (context) => BottomNAv()),
                          //          );
                          //        } else {
                          //         Navigator.pushReplacement(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => BottomNAv()),
                          //         );
                  
                          //       }
                          //     } else {
                          //       showSnackBar(context, 'Please Verify Your Email');
                          //     }
                          //   } else {
                          //      print('something error');
                          //  }
                        },
                        color: secondColor,
                        child: Text(
                          "Log In".tr(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Or".tr(),
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 330.w,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(color: secondColor)),
                        child: InkWell(
                          onTap: () async {
                            //await authCubit.signInWithGoogle();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'asset/red.svg',
                                width: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Sign In with Google".tr(),
                                style: TextStyle(color: secondColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont have Account ?".tr(),
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Rigister()),
                              );
                            },
                            child: Text(
                              "Sign Up".tr(),
                              style: TextStyle(color: secondColor),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

//   class AweseomSnackBarExample extends StatelessWidget {
//   const AweseomSnackBarExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ElevatedButton(
//               child: const Text('Show Awesome SnackBar'),
//               onPressed: () {
//                 final snackBar = SnackBar(
//                   /// need to set following properties for best effect of awesome_snackbar_content
//                   elevation: 0,
//                   behavior: SnackBarBehavior.floating,
//                   backgroundColor: Colors.transparent,
//                   content: AwesomeSnackbarContent(
//                     title: 'On Snap!',
//                     message:
//                         'This is an example error message that will be shown in the body of snackbar!',

//                     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
//                     contentType: ContentType.failure,
//                   ),
//                 );

//                 ScaffoldMessenger.of(context)
//                   ..hideCurrentSnackBar()
//                   ..showSnackBar(snackBar);
//               },
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               child: const Text('Show Awesome Material Banner'),
//               onPressed: () {
//                 final materialBanner = MaterialBanner(
//                   /// need to set following properties for best effect of awesome_snackbar_content
//                   elevation: 0,
//                   backgroundColor: Colors.transparent,
//                   forceActionsBelow: true,
//                   content: AwesomeSnackbarContent(
//                     title: 'Oh Hey!!',
//                     message:
//                         'This is an example error message that will be shown in the body of materialBanner!',

//                     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
//                     contentType: ContentType.success,
//                     // to configure for material banner
//                     inMaterialBanner: true,
//                   ),
//                   actions: const [SizedBox.shrink()],
//                 );

//                 ScaffoldMessenger.of(context)
//                   ..hideCurrentMaterialBanner()
//                   ..showMaterialBanner(materialBanner);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
