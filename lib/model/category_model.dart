class CategoryModel {
  late String name, image;
  CategoryModel({required this.name, required this.image});

  CategoryModel.fromJson(Map<dynamic, dynamic> json) {
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
