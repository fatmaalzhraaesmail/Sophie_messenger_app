class Group {
  final String? Groupimage;
  final String? title;
  final bool? isFavourite;
  final List<String>? Images;
  final GroupActivity? groupActivity;

  Group({
    this.Groupimage,
    this.Images,
    this.groupActivity,
    this.isFavourite,
    this.title
  });
  static List<Group> GroupCard() {
    return [
      Group(
        Groupimage: 'assets/images/person1.jpg',
        groupActivity: GroupActivity.active,
        isFavourite: true,
        title: "Offline Colleage",
        Images: ["assets/images/person2.jpg","assets/images/person3.jpg","assets/images/person4.jpg","assets/images/person5.jpg","assets/images/person6.jpg"]

      ),
      Group(
         Groupimage: 'assets/images/person2.jpg',
        groupActivity: GroupActivity.active,
        isFavourite: true,
        title: "Friends & Familly",
        Images: ["assets/images/person12.jpg","assets/images/person13.jpg","assets/images/person14.jpg","assets/images/person15.jpg","assets/images/person16.jpg"]
      ),
      Group(
         Groupimage: 'assets/images/person15.jpg',
        groupActivity: GroupActivity.online,
        isFavourite: false,
        title: "Night Mate",
        Images: ["assets/images/person8.jpg","assets/images/person9.jpg","assets/images/person10.jpg"]
      ),
      Group(
         Groupimage: 'assets/images/person3.jpg',
        groupActivity: GroupActivity.inactive,
        isFavourite: false,
        title: "Tour Plan",
        Images: ["assets/images/person2.jpg","assets/images/person4.jpg","assets/images/person13.jpg","assets/images/person11.jpg"]
      ),
      Group(
        Groupimage: 'assets/images/person11.jpg',
        groupActivity: GroupActivity.online,
        isFavourite: false,
        title: "School's Buddies",
        Images: ["assets/images/person17.jpg","assets/images/person12.jpg","assets/images/person14.jpg","assets/images/person15.jpg",]
      ),
      Group(
        Groupimage: 'assets/images/person1.jpg',
        groupActivity: GroupActivity.active,
        isFavourite: false,
        title: "Offline Colleage",
        Images: ["assets/images/person2.jpg","assets/images/person3.jpg","assets/images/person4.jpg",]
      ),
      Group(
        Groupimage: 'assets/images/person3.jpg',
        groupActivity: GroupActivity.inactive,
        isFavourite: false,
        title: "Tour Plan",
        Images: ["assets/images/person12.jpg","assets/images/person2.jpg","assets/images/person4.jpg","assets/images/person13.jpg",]
      
      ),
      Group(
         Groupimage: 'assets/images/person2.jpg',
        groupActivity: GroupActivity.active,
        isFavourite: true,
        title: "Friends & Familly",
        Images: ["assets/images/person15.jpg","assets/images/person16.jpg"]
      ),
    ];
  }
}

enum GroupActivity {
  active,
  inactive,
  online,
}
