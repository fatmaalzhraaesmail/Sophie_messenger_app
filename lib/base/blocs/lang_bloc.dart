import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/config/app_events.dart';
import 'package:sophie_messenger_app/config/app_states.dart';
import 'package:sophie_messenger_app/handlers/localization_handler.dart';
import 'package:sophie_messenger_app/handlers/shared_handler.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:rxdart/rxdart.dart';

class LangBloc {
  initLang() {
    String value = SharedHandler.instance!.getData(key: SharedKeys().lang, valueType: ValueType.string);
    value = value != "" ? value : "en";
    return updateLang = value;
  }

  static LangBloc get instnace => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  final lang = BehaviorSubject<String?>();

  set updateLang(String value) {
    if (value != currentLang()) SharedHandler.instance!.setData(SharedKeys().lang, value: value);
    lang.sink.add(value);
  }

  Stream<String?> get langStream => lang.stream.asBroadcastStream();
}

LangBloc langBloc = LangBloc();
