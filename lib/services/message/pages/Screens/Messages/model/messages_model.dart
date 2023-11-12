import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/model/status_model.dart';

class Messages {
  final String? image;
  final UserStatus? userStatus;
  final MessageType? messageType;
  final String? userName;
  final bool? isSeen;
  final UserMessagesStatus? userMessagesStatus;
  final List<String>? messgaes;

  Messages(
      {this.image,
      this.isSeen,
      this.userMessagesStatus,
      this.messgaes,
      this.userName,
      this.userStatus,
      this.messageType});
  static List<Messages> MessagesCard() {
    return [
      Messages(
        image: 'assets/images/person1.jpg',
        isSeen: false,
        userMessagesStatus: UserMessagesStatus.live,
        messgaes: ["Hello Iam Fatma?"],
        userName: "Fatma Alzhraa",
        userStatus: UserStatus.active,
        messageType: MessageType.text,
      ),
      Messages(
        image: 'assets/images/person2.jpg',
        isSeen: true,
        userMessagesStatus: UserMessagesStatus.inactive,
        messgaes: ["", "Hey! What's up, long time no see?"],
        userName: "Eman Ahmed",
        userStatus: UserStatus.inactive,
        messageType: MessageType.text,
      ),
      Messages(
        image: 'assets/images/person3.jpg',
        isSeen: true,
        userName: "Tamer Samir",
        userMessagesStatus: UserMessagesStatus.online,
        messgaes: ["You Missed a call"],
        userStatus: UserStatus.active,
        messageType: MessageType.call,
      ),
      Messages(
        image: 'assets/images/person1.jpg',
        isSeen: false,
        userMessagesStatus: UserMessagesStatus.active,
        messgaes: ["we meet new user"],
        userName: "Ahmed yousry",
        userStatus: UserStatus.inactive,
        messageType: MessageType.text,
      ),
      Messages(
        image: 'assets/images/person1.jpg',
        isSeen: true,
        userMessagesStatus: UserMessagesStatus.inactive,
        messgaes: ["she going to make it happened"],
        userName: "yassima Esmail",
        userStatus: UserStatus.online,
        messageType: MessageType.video,
      ),
      Messages(
        image: 'assets/images/person1.jpg',
        isSeen: false,
        userMessagesStatus: UserMessagesStatus.online,
        messgaes: ["free for a quick call"],
        userName: "Ahlam somaa",
        userStatus: UserStatus.online,
        messageType: MessageType.text,
      ),
      Messages(
        image: 'assets/images/person1.jpg',
        isSeen: true,
        userMessagesStatus: UserMessagesStatus.active,
        messgaes: ["lets join a video call"],
        userName: "Eyad Mazen",
        userStatus: UserStatus.online,
        messageType: MessageType.call,
      ),
    ];
  }
}

enum UserMessagesStatus { active, inactive, online, live }

enum MessageType {
  text,
  call,
  video,
}
