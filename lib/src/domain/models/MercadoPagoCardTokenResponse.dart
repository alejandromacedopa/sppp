import 'dart:convert';

import 'package:sppp/src/domain/models/MercadoPagoCardTokenBody.dart';

MercadoPagoCardTokenResponse mercadoPagoCardTokenResponseFromJson(String str) =>
    MercadoPagoCardTokenResponse.fromJson(json.decode(str));

String mercadoPagoCardTokenResponseToJson(MercadoPagoCardTokenResponse data) =>
    json.encode(data.toJson());

class MercadoPagoCardTokenResponse {
  String id;
  String publicKey;
  String firstSixDigits;
  int expirationMonth;
  int expirationYear;
  String lastFourDigits;
  Cardholder cardholder;
  String status;
  DateTime dateCreated;
  DateTime dateLastUpdated;
  DateTime dateDue;
  bool luhnValidation;
  bool liveMode;
  bool requireEsc;
  int cardNumberLength;
  int securityCodeLength;

  MercadoPagoCardTokenResponse({
    required this.id,
    required this.publicKey,
    required this.firstSixDigits,
    required this.expirationMonth,
    required this.expirationYear,
    required this.lastFourDigits,
    required this.cardholder,
    required this.status,
    required this.dateCreated,
    required this.dateLastUpdated,
    required this.dateDue,
    required this.luhnValidation,
    required this.liveMode,
    required this.requireEsc,
    required this.cardNumberLength,
    required this.securityCodeLength,
  });

  factory MercadoPagoCardTokenResponse.fromJson(Map<String, dynamic> json) =>
      MercadoPagoCardTokenResponse(
        id: json["id"],
        publicKey: json["public_key"],
        firstSixDigits: json["first_six_digits"],
        expirationMonth: json["expiration_month"],
        expirationYear: json["expiration_year"],
        lastFourDigits: json["last_four_digits"],
        cardholder: Cardholder.fromJson(json["cardholder"]),
        status: json["status"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        dateDue: DateTime.parse(json["date_due"]),
        luhnValidation: json["luhn_validation"],
        liveMode: json["live_mode"],
        requireEsc: json["require_esc"],
        cardNumberLength: json["card_number_length"],
        securityCodeLength: json["security_code_length"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "public_key": publicKey,
        "first_six_digits": firstSixDigits,
        "expiration_month": expirationMonth,
        "expiration_year": expirationYear,
        "last_four_digits": lastFourDigits,
        "cardholder": cardholder.toJson(),
        "status": status,
        "date_created": dateCreated.toIso8601String(),
        "date_last_updated": dateLastUpdated.toIso8601String(),
        "date_due": dateDue.toIso8601String(),
        "luhn_validation": luhnValidation,
        "live_mode": liveMode,
        "require_esc": requireEsc,
        "card_number_length": cardNumberLength,
        "security_code_length": securityCodeLength,
      };
}
