
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/model/chat_model.dart';

class ChatState {}

class ChatInitialState extends ChatState {}

class ChatSuccessState extends ChatState {
  List<Message> messages;
  ChatSuccessState({required this.messages});
}

class ChatFailkState extends ChatState {}
