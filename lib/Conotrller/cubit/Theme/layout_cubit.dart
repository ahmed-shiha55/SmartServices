import 'package:flutter/cupertino.dart';
import 'package:finialproject/constant/id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finialproject/constant/network.dart';
import 'package:finialproject/Conotrller/cubit/Theme/layout_states..dart';


class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit() : super(InitialLayoutState());

  static LayoutCubit getInstance(BuildContext context){ return BlocProvider.of<LayoutCubit>(context); }  // Todo: get instance from this cubit

  // Todo: related to App language
  // Future<void> changeAppLanguage({required Locale locale}) async {
  //   await CacheHelper.saveCacheData(key: "current_locale_app",value: locale.languageCode).then((value){
  //     if( value == true )
  //     {
  //       currentLocaleApp = Locale(locale.languageCode);
  //       emit(ChangeAppLanguageSuccessState());
  //     }
  //     else
  //     {
  //       emit(ChangeAppLanguageErrorState());
  //     }
  //   });
  // }

  // Todo: change the theme
  Future<void> changeAppTheme({required bool newValue}) async {
    await CacheHelper.saveCacheData(key: "isDark", val: newValue).then((value){
      isDark = newValue;
      emit(ChangeAppThemeSuccessState());
    }).catchError((error){
      debugPrint("Error during change The Theme, reason is $error");
      emit(ChangeAppThemeErrorState());
    });
  }

  // Todo: This related to BottomNavigationBar
  

  // Todo: this related to newsScreen about changeDropDownItem
  String country = "eg";
  String category = "general";
  void selectCountry(String val) {
    country = val;
    // Todo: need to implement it getNews(country: country,category: category);
    emit(ChangeSelectedCountryState());
  }

  void selectCategory(String val) {
    category = val;
    // Todo: need to implement it getNews(country: country,category: category);
    emit(ChangeSelectedCategoryState());
  }

}