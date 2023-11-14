import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/constant/message_constant.dart';
class Message {
  final String message;
  final String id;
  Message(this.message, this.id);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage], jsonData['id']);
  }
}