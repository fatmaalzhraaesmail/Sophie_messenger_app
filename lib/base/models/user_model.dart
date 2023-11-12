class UserModel {
  String? name;
  String? email;
  String? gender;
  String? phone;
  String? image;

  UserModel({this.name, this.email, this.gender, this.phone,this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      image: json['image'], 
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "gender": gender,
        "phone": phone,
        "image":image
      };
}
