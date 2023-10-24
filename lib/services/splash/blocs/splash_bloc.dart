import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/config/app_states.dart';
import 'package:sophie_messenger_app/handlers/shared_handler.dart';
import 'package:sophie_messenger_app/routers/routers.dart';

// import '../../../routers/navigator.dart';

// class SplashBloc extends Cubit<AppStates> {

//   SplashBloc() : super(Start());

//   void checkLogin() async {
//     if (SharedHandler.instance!.getData(key: SharedKeys().isLogin, valueType: ValueType.bool)) {
//       CustomNavigator.push(Routes.home);
//     } else {
//       CustomNavigator.push(Routes.login);
//     }
//   }
// }
