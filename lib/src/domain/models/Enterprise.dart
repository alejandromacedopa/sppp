// To parse this JSON data, do
//
//     final enterprise = enterpriseFromJson(jsonString);

import 'dart:convert';

List<Enterprise> enterpriseFromJson(String str) => List<Enterprise>.from(json.decode(str).map((x) => Enterprise.fromJson(x)));

String enterpriseToJson(List<Enterprise> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Enterprise {
  int? id;
  String name;
  String? logoImageUrl;
  String supervisor;

  Enterprise({
    this.id,
    required this.name,
    this.logoImageUrl,
    required this.supervisor,
  });

  static List<Enterprise> fromJsonList(List<dynamic> jsonList) {
    List<Enterprise> toList = [];
    jsonList.forEach((item) {
      Enterprise enterprise = Enterprise.fromJson(item);
      toList.add(enterprise);
    });
    return toList;
  }

  factory Enterprise.fromJson(Map<String, dynamic> json) => Enterprise(
    id: json["id"],
    name: json["name"],
    logoImageUrl: json["logo_image_url"],
    supervisor: json["supervisor"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo_image_url": logoImageUrl,
    "supervisor": supervisor
  };
}
