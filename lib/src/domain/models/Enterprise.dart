import 'dart:convert';

Enterprise enterpriseFromJson(String str) => Enterprise.fromJson(json.decode(str));

String enterpriseToJson(Enterprise data) => json.encode(data.toJson());

class Enterprise {
  int? id;
  String name;
  String? logo_image_url;
  String supervisor;

  Enterprise({
    this.id,
    required this.name,
    this.logo_image_url,
    required this.supervisor
  });

  static List<Enterprise> fromJsonList(List<dynamic> jsonList){ List<Enterprise> toList = [];
    jsonList.forEach((item){ Enterprise enterprise = Enterprise.fromJson(item);toList.add(enterprise);});
    return toList;
  }

  factory Enterprise.fromJson(Map<String, dynamic> json) => Enterprise(
    id: json["id"] ?? 0,
    name: json["name"],
    logo_image_url: json["logo_image_url"],
    supervisor: json["supervisor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo_image_url": logo_image_url,
    "supervisor": supervisor,
  };
}
