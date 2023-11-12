import '../../Messages/model/status_model.dart';

class Calls {
  final String? image;
  final UserStatus? userStatus;
  final MessageType? messageType;
  final String? userName;
  final bool? isSeen;
  final int? missedcount;
  final String? lastTime;
  final CallsStatus? callsStatus;

  Calls(
      {this.image,
      this.isSeen,
      this.userName,
      this.userStatus,
      this.messageType,
      this.missedcount,
      this.lastTime,
      this.callsStatus,
      
      });
  static List<Calls> CallsCard() {
    return [
      Calls(
        image: 'assets/images/person1.jpg',
        isSeen: false,
        userName: "Fatma Alzhraa",
        userStatus: UserStatus.active,
        messageType: MessageType.video,
        missedcount: 3,
        callsStatus: CallsStatus.missed,
      ),
      Calls(
          image: 'assets/images/person2.jpg',
          isSeen: true,
          userName: "Eman Ahmed",
          userStatus: UserStatus.inactive,
          messageType: MessageType.video,
          lastTime: "5m",
          callsStatus: CallsStatus.done,
          ),
      Calls(
          image: 'assets/images/person3.jpg',
          isSeen: true,
          userName: "Tamer Samir",
          userStatus: UserStatus.active,
          messageType: MessageType.call,
          lastTime: "3m",
          callsStatus: CallsStatus.done,
          ),
      Calls(
          image: 'assets/images/person1.jpg',
          isSeen: false,
          userName: "Ahmed yousry",
          userStatus: UserStatus.inactive,
          messageType: MessageType.call,
          missedcount: 1,
          callsStatus: CallsStatus.missed,
          
          ),
      Calls(
          image: 'assets/images/person1.jpg',
          isSeen: true,
          userName: "yassima Esmail",
          userStatus: UserStatus.online,
          messageType: MessageType.video,
          lastTime: "yesterday",
          callsStatus: CallsStatus.done,
          
          ),
      Calls(
        image: 'assets/images/person1.jpg',
        isSeen: false,
        userName: "Ahlam somaa",
        userStatus: UserStatus.online,
        messageType: MessageType.call,
        missedcount: 1,
        callsStatus: CallsStatus.missed,
      ),
      Calls(
          image: 'assets/images/person1.jpg',
          isSeen: true,
          userName: "Eyad Mazen",
          userStatus: UserStatus.online,
          messageType: MessageType.call,
          lastTime: "week",
          callsStatus: CallsStatus.done,
          
          ),
      Calls(
          image: 'assets/images/person1.jpg',
          isSeen: true,
          userName: "yassima Esmail",
          userStatus: UserStatus.online,
          messageType: MessageType.video,
          lastTime: "18d",
          callsStatus: CallsStatus.done,
          
          ),
    ];
  }
}

enum MessageType {
  text,
  call,
  video,
}

enum CallsStatus { missed, done }
