import 'dart:convert';

Courses coursesFromJson(String str) => Courses.fromJson(json.decode(str));

String coursesToJson(Courses data) => json.encode(data.toJson());

class Courses {
  int? id;
  String name;
  String description;
  String? image1;
  String? image2;
  int idCategory;
  double price;
  int? quantity;

  Courses(
      {this.id,
        required this.name,
        required this.description,
        this.image1,
        this.image2,
        required this.idCategory,
        required this.price,
        this.quantity});

  static List<Courses> fromJsonList(List<dynamic> jsonList) {
    List<Courses> toList = [];
    jsonList.forEach((item) {
      Courses courses = Courses.fromJson(item);
      toList.add(courses);
    });
    return toList;
  }

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
      id: json["id"],
      name: json["name"] ?? '',
      description: json["description"] ?? '',
      image1: json["image1"],
      image2: json["image2"],
      idCategory: json["id_category"] is String
          ? int.parse(json["id_category"])
          : json["id_category"],
      price: json["price"] is String
          ? double.parse(json["price"])
          : json["price"] is int
          ? (json["price"] as int).toDouble()
          : json["price"],
      quantity: json["quantity"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image1": image1,
    "image2": image2,
    "id_category": idCategory,
    "price": price,
    "quantity": quantity
  };
}