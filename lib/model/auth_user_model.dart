import 'package:e_commerce_app/model/cart_product_model.dart';

class UserModel {
  String? uid, phone, name, email, profileImage;
  List<CartProductModel>? cart;

  UserModel({
    this.email,
    this.phone,
    this.name,
    this.uid,
    this.profileImage,
    this.cart,
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
    cart = json['cart'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'uid': uid,
      'profileImage': profileImage,
      'cart': cart,
    };
  }
}
