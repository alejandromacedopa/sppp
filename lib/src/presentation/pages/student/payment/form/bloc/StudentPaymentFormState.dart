
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:sppp/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class StudentPaymentFormState extends Equatable {
  final String cardNumber;
  final String expireDate;
  final String cardHolderName;
  final String cvvCode;
  final String? identificationType;
  final String identificationNumber;
  final bool isCvvFocused;
  final GlobalKey<FormState>? formKey;
  final List<MercadoPagoIdentificationType> identificationTypes;
  final Resource? response;
  final double totalToPay;

  const StudentPaymentFormState(
      {this.cardNumber = '',
        this.expireDate = '',
        this.cardHolderName = '',
        this.cvvCode = '',
        this.isCvvFocused = false,
        this.formKey,
        this.identificationTypes = const [],
        this.identificationType,
        this.identificationNumber = '',
        this.response,
        this.totalToPay = 0});

  MercadoPagoCardTokenBody toCardTokenBody() => MercadoPagoCardTokenBody(
      cardNumber: cardNumber.replaceAll(RegExp(' '), ''),
      expirationYear: '20${expireDate.split('/')[1]}', // 2025
      expirationMonth: int.parse(expireDate.split('/')[0]), // 11
      securityCode: cvvCode,
      cardholder: Cardholder(
          name: cardHolderName,
          identification: Identification(
              number: identificationNumber, type: identificationType ?? '')));

  StudentPaymentFormState copyWith(
      {String? cardNumber,
        String? expireDate,
        String? cardHolderName,
        String? cvvCode,
        bool? isCvvFocused,
        List<MercadoPagoIdentificationType>? identificationTypes,
        GlobalKey<FormState>? formKey,
        String? identificationType,
        String? identificationNumber,
        Resource? response,
        double? totalToPay}) {
    return StudentPaymentFormState(
        cardNumber: cardNumber ?? this.cardNumber,
        expireDate: expireDate ?? this.expireDate,
        cardHolderName: cardHolderName ?? this.cardHolderName,
        cvvCode: cvvCode ?? this.cvvCode,
        isCvvFocused: isCvvFocused ?? this.isCvvFocused,
        identificationTypes: identificationTypes ?? this.identificationTypes,
        identificationType: identificationType ?? this.identificationType,
        identificationNumber: identificationNumber ?? this.identificationNumber,
        formKey: formKey,
        response: response,
        totalToPay: totalToPay ?? this.totalToPay);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    cardNumber,
    expireDate,
    cardHolderName,
    cvvCode,
    isCvvFocused,
    identificationTypes,
    identificationType,
    identificationNumber,
    response,
    totalToPay
  ];
}
