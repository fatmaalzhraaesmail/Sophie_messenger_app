import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/handlers/shared_handler.dart';

import '../../config/app_events.dart';
import '../../config/app_states.dart';
import '../../routers/navigator.dart';
import '../models/user_model.dart';

class UserBloc extends Cubit<AppStates> {
  UserBloc() : super(Loading()) {
    // on<Get>(_getUser);
    // on<Update>(_update);
  }

  UserModel model = UserModel();
  static UserBloc get instance =>
      BlocProvider.of<UserBloc>(CustomNavigator.navigatorState.currentContext!);
  _getUser(AppEvents event, Emitter emit) async {
    emit(Loading());
    model = UserModel.fromJson(SharedHandler.instance!
        .getData(key: SharedKeys().user, valueType: ValueType.map));
  }

  _update(AppEvents event, Emitter emit) async => emit(Start());
  void Get() {}
  void Update() {
    
  }
}
