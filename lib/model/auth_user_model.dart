class UserModel {
  String? uid, phone, name, email, profileImage;

  UserModel({
    this.email,
    this.phone,
    this.name,
    this.uid,
    this.profileImage,
  });

  // بعمل constructor وبملاه من ال json الي تحت عشان الداتا تتحط في اماكنها
  UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return;
    }
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
    uid = json['uid'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'uid': uid,
      'profileImage': profileImage,
    };
  }
}
