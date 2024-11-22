import 'package:equatable/equatable.dart';

abstract class StudentPaymentFormEvent extends Equatable {
  const StudentPaymentFormEvent();
  @override
  List<Object?> get props => [];
}

class StudentPaymentFormInitEvent extends StudentPaymentFormEvent {
  const StudentPaymentFormInitEvent();
}

class CreditCardChanged extends StudentPaymentFormEvent {

  final String cardNumber;
  final String expireDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;

   const CreditCardChanged({
    required this.cardNumber,
    required this.expireDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isCvvFocused,
  });

  @override
  List<Object?> get props => [cardNumber, expireDate, cardHolderName, cvvCode, isCvvFocused];

}

class IdentificationTypeChanged extends StudentPaymentFormEvent {
  final String identificationType;
  const IdentificationTypeChanged({required this.identificationType});
  @override
  List<Object?> get props => [identificationType];
}

class IdentificationNumberChanged extends StudentPaymentFormEvent {
  final String identificationNumber;
  const IdentificationNumberChanged({required this.identificationNumber});
  @override
  List<Object?> get props => [identificationNumber];
}

class FormSubmit extends StudentPaymentFormEvent {
  const FormSubmit();
}