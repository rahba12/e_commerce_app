class CategoryModel {
  late String name, image;
  CategoryModel({required this.name, required this.image});

  CategoryModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
