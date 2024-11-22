// To parse this JSON data, do
//
//     final mercadoPagoPaymentBody = mercadoPagoPaymentBodyFromJson(jsonString);

import 'dart:convert';

import 'package:sppp/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:sppp/src/domain/models/Order.dart';



MercadoPagoPaymentBody mercadoPagoPaymentBodyFromJson(String str) =>
    MercadoPagoPaymentBody.fromJson(json.decode(str));

String mercadoPagoPaymentBodyToJson(MercadoPagoPaymentBody data) =>
    json.encode(data.toJson());

class MercadoPagoPaymentBody {
  int transactionAmount;
  String token;
  int installments;
  String issuerId;
  String paymentMethodId;
  Payer payer;
  Order order;

  MercadoPagoPaymentBody({
    required this.transactionAmount,
    required this.token,
    required this.installments,
    required this.issuerId,
    required this.paymentMethodId,
    required this.payer,
    required this.order,
  });

  factory MercadoPagoPaymentBody.fromJson(Map<String, dynamic> json) =>
      MercadoPagoPaymentBody(
        transactionAmount: json["transaction_amount"],
        token: json["token"],
        installments: json["installments"],
        issuerId: json["issuer_id"],
        paymentMethodId: json["payment_method_id"],
        payer: Payer.fromJson(json["payer"]),
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
    "transaction_amount": transactionAmount,
    "token": token,
    "installments": installments,
    "issuer_id": issuerId,
    "payment_method_id": paymentMethodId,
    "payer": payer.toJson(),
    "order": order.toJson(),
  };
}

class Payer {
  String email;
  Identification identification;

  Payer({
    required this.email,
    required this.identification,
  });

  factory Payer.fromJson(Map<String, dynamic> json) => Payer(
    email: json["email"],
    identification: Identification.fromJson(json["identification"]),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "identification": identification.toJson(),
  };
}
