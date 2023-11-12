import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/model/status_model.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(MessagesInitial());
  static StatusCubit get(context) => BlocProvider.of(context);
  final List Statuscollection = Status.StatusCard();
}
