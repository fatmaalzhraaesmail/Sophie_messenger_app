import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/model/messages_model.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesInitial());
  static MessagesCubit get(context) => BlocProvider.of(context);
  final List Messagescollection = Messages.MessagesCard();
}
