import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finialproject/constant/id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finialproject/Model/userModel.dart';
import 'package:finialproject/constant/colors.dart';
import 'package:finialproject/View/MainScreen/home.dart';
import 'package:finialproject/View/MainScreen/addPost.dart';
import 'package:finialproject/View/MainScreen/catogry.dart';
import 'package:finialproject/View/MainScreen/profile.dart';
import 'package:finialproject/View/ChatScreen/messenger.dart';
import 'package:finialproject/Conotrller/cubit/Data/dataCubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';





// import 'package:t/screens/home.dart';

class BottomNAv extends StatelessWidget {
//late  DataCubit? datacubit;


  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  BottomNAv({super.key});

  List<Widget> _buildScreens() {
    return [
      Home(),
     // Messanger(reciverID: ),
      AddPost(),
      Catogry(),
      Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'asset/home.svg',
          width: 25,
          color: secondColor,
        ),
        title: ("Home"), // Change this to a different title
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: secondColor,
      ),
      // PersistentBottomNavBarItem(
      //   icon: SvgPicture.asset(
      //     'asset/chat.svg',
      //     width: 25,
      //     color: secondColor,
      //   ),
      //   title: ("chat"),
      //   activeColorPrimary: Colors.white,
      //   inactiveColorPrimary: secondColor,
      // ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.add_circle_outline,
          size: 30,
          color: secondColor,
        ),
        title: ("AddPost"), // Change this to a different title
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: secondColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'asset/catg.svg',
          width: 25,
          color: secondColor,
        ),
        title: ("Catogry"), // Change this to a different title
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: secondColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'asset/person.svg',
          width: 25,
          color: secondColor,
        ),
        title: ("Profile"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: secondColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
    backgroundColor: isDark ? fourColor : Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: textfiled,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style13,
    );
  }
}
