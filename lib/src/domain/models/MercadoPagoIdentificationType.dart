import 'dart:convert';

MercadoPagoIdentificationType mercadoPagoIdentificationTypeFromJson(String str) => MercadoPagoIdentificationType.fromJson(json.decode(str));

String mercadoPagoIdentificationTypeToJson(MercadoPagoIdentificationType data) => json.encode(data.toJson());

class MercadoPagoIdentificationType {
    String id;
    String name;
    String type;

    MercadoPagoIdentificationType({
        required this.id,
        required this.name,
        required this.type,
    });

    static List<MercadoPagoIdentificationType> fromJsonList(List<dynamic> jsonList) {
      List<MercadoPagoIdentificationType> toList = [];
      jsonList.forEach((item) { 
        MercadoPagoIdentificationType identificationTypes = MercadoPagoIdentificationType.fromJson(item);
        toList.add(identificationTypes);
      });
      return toList;
    }

    factory MercadoPagoIdentificationType.fromJson(Map<String, dynamic> json) => MercadoPagoIdentificationType(
        id: json["id"],
        name: json["name"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
    };
}