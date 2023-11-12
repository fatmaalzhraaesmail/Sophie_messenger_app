
class Status {
  final String? image;
  final bool? isSeen;
  final UserStatus? userStatus;

 Status({
    this.image,
    this.isSeen,
    this.userStatus,

  });
  static List <Status> StatusCard() {
    return [
     Status(
      image: 'assets/images/person1.jpg',
      isSeen: true,
      userStatus: UserStatus.live,
     ),
     Status(
      image: 'assets/images/person2.jpg',
      isSeen: false,
      userStatus: UserStatus.inactive,
     ),
     Status(
      image: 'assets/images/person3.jpg',
      isSeen: false,
      userStatus: UserStatus.online,
     ),
     Status(
      image: 'assets/images/person1.jpg',
      isSeen: true,
      userStatus: UserStatus.active,
     ),
     Status(
      image: 'assets/images/person1.jpg',
      isSeen: true,
      userStatus: UserStatus.inactive,
     ),
     Status(
      image: 'assets/images/person1.jpg',
      isSeen: false,
      userStatus: UserStatus.online,
     ),
     Status(
      image: 'assets/images/person1.jpg',
      isSeen: true,
      userStatus: UserStatus.active,
     ),
    
    ];
  }
}
enum UserStatus{
  active,inactive,online,live
}
