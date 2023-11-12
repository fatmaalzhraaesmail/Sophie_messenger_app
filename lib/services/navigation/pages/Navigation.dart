import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sophie_messenger_app/handlers/icon_handler.dart';
import 'package:sophie_messenger_app/services/navigation/bloc/Naviagtion/naviagtion_cubit.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NaviagtionCubit(),
      child: BlocConsumer<NaviagtionCubit, NaviagtionState>(
          listener: (BuildContext context, NaviagtionState state) {},
          builder: (BuildContext context, NaviagtionState state) {
            NaviagtionCubit cubit = NaviagtionCubit.get(context);
            return Scaffold(
              // appBar: cubit.appbar[cubit.currentIndex] as AppBar,
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  backgroundColor: HexColor('#f7f7f7'),
                  type: BottomNavigationBarType.fixed,
                  fixedColor: Theme.of(context).primaryColor,
                  enableFeedback: false,
                  mouseCursor: MaterialStateMouseCursor.clickable,

                  selectedIconTheme: IconThemeData(
                    color: Colors.transparent,
                  ),

                  elevation: 2,
                  currentIndex: cubit.currentIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: drawSvgIcon('person',
                          height: 30,
                          width: 30,
                          iconColor: cubit.currentIndex == 0
                              ? AppTextStyles.maincolor
                              : Colors.grey),
                      label: '',
                      backgroundColor: Colors.transparent,
                    ),
                    BottomNavigationBarItem(
                        icon: drawSvgIcon('message',
                            height: 30,
                            width: 30,
                            iconColor: cubit.currentIndex == 1
                                ? AppTextStyles.maincolor
                                : Colors.grey),
                        label: ''),
                    BottomNavigationBarItem(
                        icon: drawSvgIcon('setting',
                            height: 30,
                            width: 30,
                            iconColor: cubit.currentIndex == 2
                                ? AppTextStyles.maincolor
                                : Colors.grey),
                        label: ''),

                    //    Icon(CupertinoIcons.home, size: 30, color: Colors.white),
                    // Icon(CupertinoIcons.bell, size: 30, color: Colors.white),
                    // Icon(CupertinoIcons.chat_bubble_fill,
                    //     size: 30, color: Colors.white),
                  ],
                  onTap: (index) {
                    cubit.changeIndex(index);
                  },
                  // height: 50,
                  // items: const <Widget>[
                  //   Icon(CupertinoIcons.home, size: 30, color: Colors.white),
                  //   Icon(CupertinoIcons.bell, size: 30, color: Colors.white),
                  //   Icon(CupertinoIcons.chat_bubble_fill,
                  //       size: 30, color: Colors.white),
                  //   Icon(CupertinoIcons.person, size: 30, color: Colors.white),
                  // ],
                  // color: textColor,
                  // buttonBackgroundColor: textColor,
                  // backgroundColor: background,
                  // animationCurve: Curves.easeIn,
                  // animationDuration: const Duration(milliseconds: 400),
                  // onTap: (index) {
                  //   cubit.changeIndex(index);
                  // },
                ),
              ),
            );
          }),
    );
  }
}
