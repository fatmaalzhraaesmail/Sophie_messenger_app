import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/services/home/pages/home_page.dart';
import 'package:sophie_messenger_app/services/message/pages/messageNavigator.dart';
import '../../../../routers/navigator.dart';
import '../../../../routers/routers.dart';
// import '../../../message/widget/message_navbar_widget.dart';
import '../../../settings/pages/settings.dart';
part 'naviagtion_state.dart';

class NaviagtionCubit extends Cubit<NaviagtionState> {
  NaviagtionCubit() : super(NaviagtionInitial());
  static NaviagtionCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;
  List<Widget> screens = [
    HomePage(),
    MessageNavigatorScreen(),
    SettingsScreen()
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
