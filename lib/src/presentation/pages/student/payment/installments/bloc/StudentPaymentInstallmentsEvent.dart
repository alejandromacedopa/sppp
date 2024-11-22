import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:sppp/src/domain/models/MercadoPagoInstallments.dart';

abstract class StudentPaymentInstallmentsEvent extends Equatable {
  const StudentPaymentInstallmentsEvent();
  @override
  List<Object?> get props => [];
}

class GetInstallments extends StudentPaymentInstallmentsEvent {
  final String firstSixDigits;
  final String amount;

  const GetInstallments({required this.firstSixDigits, required this.amount});

  @override
  List<Object?> get props => [firstSixDigits, amount];
}

class InstallmentChanged extends StudentPaymentInstallmentsEvent {
  final String installment;
  const InstallmentChanged({required this.installment});
  @override
  List<Object?> get props => [installment];
}

class FormSubmit extends StudentPaymentInstallmentsEvent {
  final MercadoPagoCardTokenResponse mercadoPagoCardTokenResponse;
  final MercadoPagoInstallments installments;
  const FormSubmit(
      {required this.mercadoPagoCardTokenResponse, required this.installments});
  @override
  List<Object?> get props => [mercadoPagoCardTokenResponse, installments];
}
