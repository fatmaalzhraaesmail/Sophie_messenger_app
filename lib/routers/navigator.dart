
import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/handlers/qr_code_scanner/qr_scanner_view.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/continue_setup/pages/contiue_setup.dart';
import 'package:sophie_messenger_app/services/myprofile/pages/myprofile.dart';
import 'package:sophie_messenger_app/services/login/pages/login_screen.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Calls/pages/calls.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Groups/pages/groups.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/pages/chat.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/pages/message_screen.dart';
import 'package:sophie_messenger_app/services/navigation/pages/Navigation.dart';
import 'package:sophie_messenger_app/services/register/pages/register_screen.dart';
import 'package:sophie_messenger_app/services/settings/pages/settings.dart';
import 'package:sophie_messenger_app/services/verification/pages/Phone_number.dart';
import 'package:sophie_messenger_app/services/verification/pages/otp_screen.dart';

import '../services/message/pages/messageNavigator.dart';
import '../services/splash/pages/splash_page.dart';

const begin = Offset(0.0, 1.0);
const end = Offset.zero;
const curve = Curves.easeInOut;
var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();

  static _pageRoute(Widget screen) => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return _pageRoute(LoginScreen());
      case Routes.register:
        return _pageRoute(RegisterScreen());
      case Routes.splash:
        return _pageRoute(const SplashPage());
      case Routes.qrScannerCode:
        return _pageRoute(const QrCodeScannerView());
      case Routes.myProfile:
        return _pageRoute(const MyProfile());
      case Routes.continue_setup:
        return _pageRoute(ContinueSetup());
      case Routes.phone:
        return _pageRoute(Phone());
    
      case Routes.navigation:
        return _pageRoute(NavigationScreen());
      case Routes.messageNavigator:
        return _pageRoute(MessageNavigatorScreen());
      case Routes.settinsg:
        return _pageRoute(SettingsScreen());
      case Routes.message:
        return _pageRoute(MessageScreen());
      case Routes.groups:
        return _pageRoute(GroupsScreen());
      case Routes.calls:
        return _pageRoute(CallsScreen());
      case Routes.chatpersons:
        return _pageRoute(ChatScreen());
      case Routes.otp:
        final phoneNumber = settings.arguments;
        return _pageRoute(OtpScreen(phoneNumber: phoneNumber,));
    }
    return MaterialPageRoute(builder: (_) => Container());
  }

  static pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static push(String routeName,
      {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}
