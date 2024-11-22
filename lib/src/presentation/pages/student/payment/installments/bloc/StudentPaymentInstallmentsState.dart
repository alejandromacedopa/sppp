import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class StudentPaymentInstallmentsState extends Equatable {
  final Resource? responseInstallments;
  final Resource? responsePayment;
  final String? installment;

  StudentPaymentInstallmentsState(
      {this.responseInstallments, this.installment, this.responsePayment});

  StudentPaymentInstallmentsState copyWith(
      {Resource? responseInstallments,
      Resource? responsePayment,
      String? installment}) {
    return StudentPaymentInstallmentsState(
        responseInstallments: responseInstallments ?? this.responseInstallments,
        installment: installment ?? this.installment,
        responsePayment: responsePayment);
  }

  @override
  List<Object?> get props =>
      [responseInstallments, installment, responsePayment];
}
