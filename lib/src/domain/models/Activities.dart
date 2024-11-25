import 'dart:convert';

Activities activitiesFromJson(String str) =>
    Activities.fromJson(json.decode(str));

String activitiesToJson(Activities data) => json.encode(data.toJson());

class Activities {
  String nombre;
  String? descripcion;
  List<Time>? times;
  int? evidenceId;

  Activities({
    required this.nombre,
    this.descripcion,
    this.times,
    this.evidenceId,
  });

  static List<Activities> fromJsonList(List<dynamic> jsonList) {
    List<Activities> toList = [];
    jsonList.forEach((item) {
      Activities activity = Activities.fromJson(item);
      toList.add(activity);
    });
    return toList;
  }

  factory Activities.fromJson(Map<String, dynamic> json) => Activities(
        nombre: json["nombre"] ?? '',
        descripcion: json["descripcion"],
        times: json["times"] != null
            ? List<Time>.from(json["times"].map((x) => Time.fromJson(x)))
            : null,
        evidenceId: json["evidenceId"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "times": times != null
            ? List<dynamic>.from(times!.map((x) => x.toJson()))
            : null,
        "evidenceId": evidenceId,
      };
}

class Time {
  String start;
  String end;

  Time({required this.start, required this.end});

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        start: json["start"] ?? '',
        end: json["end"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
      };
}
