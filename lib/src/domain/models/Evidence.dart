import 'dart:convert';

Evidence evidenceFromJson(String str) => Evidence.fromJson(json.decode(str));
String evidenceToJson(Evidence data) => json.encode(data.toJson());

class Evidence {
  int? id;
  String name;
  String? description;
  String evidenceLink;
  String? createdAt;

  Evidence({
    this.id,
    required this.name,
    this.description,
    required this.evidenceLink,
    this.createdAt,
  });

  factory Evidence.fromJson(Map<String, dynamic> json) => Evidence(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        evidenceLink: json["evidence_link"],
        createdAt: json.containsKey("created_at") ? json["created_at"] : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "evidence_link": evidenceLink,
        if (createdAt != null) "created_at": createdAt,
      };
}
