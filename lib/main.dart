import 'package:flutter/material.dart';
import 'package:finialproject/constant/id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finialproject/constant/network.dart';
import 'package:finialproject/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finialproject/View/AuthScreen/loginPage.dart';
import 'package:finialproject/View/MainScreen/bottomnav.dart';
import 'package:finialproject/View/WelcomeScreen/splashPage.dart';
import 'package:finialproject/Conotrller/cubit/Auth/authCubit.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:finialproject/Conotrller/cubit/Theme/layout_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.cacheInit();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  userID = await CacheHelper.getCacheData(key: 'uid') ?? "false";
  isDark = await CacheHelper.getCacheData(key: "isDark") ?? false;

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'SA')],
        path:
            'asset/translations', // <-- change the path of the translation files
        saveLocale: true,
        startLocale: Locale('ar', 'SA'),
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(userID);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
            create: (context) => DataCubit()
              ..getCatgories()
              ..getMyData()
              ..getProducts()
              ..getFaviorteList()
              ..getusers()),
      ],
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          // Use builder only if you need to use library outside ScreenUtilInit context
          builder: (_, child) {
            return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                title: 'SmartServices',
                home:
                    // userID != null &&
                    //         FirebaseAuth.instance.currentUser!.emailVerified
                    //     ? BottomNAv()
                    //:
                    Splash()
                    //Login()
                    );
          }),
    );
  }
}

//   flutter run -d chrome --web-renderer html
