import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  int? id;
  String name;
  String description;
  String? image;

  Category({
    this.id,
    required this.name,
    required this.description,
    this.image,
  });

  //retornando la lista de categorias
  static List<Category> fromJsonList(List<dynamic> jsonList){
    List<Category> toList = [];
    jsonList.forEach((item){
      Category category = Category.fromJson(item);
      toList.add(category);
    });
    return toList;
  }

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
  };
}