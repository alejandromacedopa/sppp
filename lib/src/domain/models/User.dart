
import 'package:sppp/src/domain/models/Roles.dart';

class User {
  String? id;
  String name;
  String lastname;
  String? email;
  String phone;
  String? password;
  String? image;
  String? notificationToken;
  List<Roles>? roles;

  User({
    this.id,
    required this.name,
    required this.lastname,
    this.email,
    required this.phone,
    this.password,
    this.image,
    this.notificationToken,
    this.roles,
  });

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => User.fromJson(item)).toList();
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? '',
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"] ?? '',
    image: json["image"],
    notificationToken: json["notification_token"] ?? '',
    roles: json["roles"] != null
        ? List<Roles>.from(json["roles"].map((x) => Roles.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "password": password,
    "image": image,
    "notification_token": notificationToken,
    "roles": roles != null
        ? List<dynamic>.from(roles!.map((x) => x.toJson()))
        : [],
  };
}
