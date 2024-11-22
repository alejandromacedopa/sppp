// To parse this JSON data, do
//
//     final mercadoPagoPaymentResponse2 = mercadoPagoPaymentResponse2FromJson(jsonString);

import 'dart:convert';

MercadoPagoPaymentResponse2 mercadoPagoPaymentResponse2FromJson(String str) =>
    MercadoPagoPaymentResponse2.fromJson(json.decode(str));

String mercadoPagoPaymentResponse2ToJson(MercadoPagoPaymentResponse2 data) =>
    json.encode(data.toJson());

class MercadoPagoPaymentResponse2 {
  int id;
  String status;
  int transactionAmount;
  String payment_method_id;
  Payer payer;

  MercadoPagoPaymentResponse2({
    required this.id,
    required this.status,
    required this.transactionAmount,
    required this.payment_method_id,
    required this.payer,
  });

  factory MercadoPagoPaymentResponse2.fromJson(Map<String, dynamic> json) =>
      MercadoPagoPaymentResponse2(
        id: json["id"],
        status: json["status"],
        transactionAmount: json["transaction_amount"],
        payment_method_id: json["status"],
        payer: Payer.fromJson(json["payer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "transaction_amount": transactionAmount,
        "payer": payer.toJson(),
      };
}

class Payer {
  String email;

  Payer({
    required this.email,
  });

  factory Payer.fromJson(Map<String, dynamic> json) => Payer(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
