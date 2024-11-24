import 'package:sppp/src/domain/models/Courses.dart';

class Order {
  String idClient;
  int idAddress;
  List<Courses> courses;

  Order({
    required this.idClient,
    required this.idAddress,
    required this.courses,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        idClient: json["id_client"],
        idAddress: json["id_address"],
        courses: List<Courses>.from(
            json["courses"].map((x) => Courses.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_client": idClient,
        "id_address": idAddress,
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
      };
}
