import 'dart:convert';

MercadoPagoCardTokenBody mercadoPagoCardTokenBodyFromJson(String str) =>
    MercadoPagoCardTokenBody.fromJson(json.decode(str));

String mercadoPagoCardTokenBodyToJson(MercadoPagoCardTokenBody data) =>
    json.encode(data.toJson());

class MercadoPagoCardTokenBody {
  String cardNumber;
  String expirationYear;
  int expirationMonth;
  String securityCode;
  Cardholder cardholder;

  MercadoPagoCardTokenBody({
    required this.cardNumber,
    required this.expirationYear,
    required this.expirationMonth,
    required this.securityCode,
    required this.cardholder,
  });

  factory MercadoPagoCardTokenBody.fromJson(Map<String, dynamic> json) =>
      MercadoPagoCardTokenBody(
        cardNumber: json["card_number"],
        expirationYear: json["expiration_year"],
        expirationMonth: json["expiration_month"],
        securityCode: json["security_code"],
        cardholder: Cardholder.fromJson(json["cardholder"]),
      );

  Map<String, dynamic> toJson() => {
        "card_number": cardNumber,
        "expiration_year": expirationYear,
        "expiration_month": expirationMonth,
        "security_code": securityCode,
        "cardholder": cardholder.toJson(),
      };
}

class Cardholder {
  String name;
  Identification identification;

  Cardholder({
    required this.name,
    required this.identification,
  });

  factory Cardholder.fromJson(Map<String, dynamic> json) => Cardholder(
        name: json["name"],
        identification: Identification.fromJson(json["identification"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "identification": identification.toJson(),
      };
}

class Identification {
  String number;
  String type;

  Identification({
    required this.number,
    required this.type,
  });

  factory Identification.fromJson(Map<String, dynamic> json) => Identification(
        number: json["number"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "type": type,
      };
}
