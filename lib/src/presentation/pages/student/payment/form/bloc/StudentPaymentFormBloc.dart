
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:sppp/src/domain/useCases/MercadoPago/MercadoPagoUseCases.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/bloc/StudentPaymentFormEvent.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/bloc/StudentPaymentFormState.dart';

class StudentPaymentFormBloc
    extends Bloc<StudentPaymentFormEvent, StudentPaymentFormState> {
  MercadoPagoUseCases mercadoPagoUseCases;
  ShoppingBagUseCases shoppingBagUseCases;

  StudentPaymentFormBloc(this.mercadoPagoUseCases, this.shoppingBagUseCases)
      : super(StudentPaymentFormState()) {
    on<StudentPaymentFormInitEvent>(_onClientPaymentFormInitEvent);
    on<CreditCardChanged>(_onCreditCardChanged);
    on<IdentificationTypeChanged>(_onIdentificationTypeChanged);
    on<IdentificationNumberChanged>(_onIdentificationNumberChanged);
    on<FormSubmit>(_onFormSubmit);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onClientPaymentFormInitEvent(StudentPaymentFormInitEvent event,
      Emitter<StudentPaymentFormState> emit) async {
    emit(state.copyWith(formKey: formKey));
    Resource response = await mercadoPagoUseCases.getIdentificationTypes.run();
    if (response is Success) {
      List<MercadoPagoIdentificationType> identificationTypes = response.data;
      emit(state.copyWith(
          identificationTypes: identificationTypes, formKey: formKey));
    }
    double totalToPay = await shoppingBagUseCases.getTotal.run();
    emit(state.copyWith(totalToPay: totalToPay, formKey: formKey));
  }

  Future<void> _onCreditCardChanged(
      CreditCardChanged event, Emitter<StudentPaymentFormState> emit) async {
    emit(state.copyWith(
        cardNumber: event.cardNumber,
        expireDate: event.expireDate,
        cardHolderName: event.cardHolderName,
        cvvCode: event.cvvCode,
        isCvvFocused: event.isCvvFocused,
        formKey: formKey));
  }

  Future<void> _onIdentificationTypeChanged(IdentificationTypeChanged event,
      Emitter<StudentPaymentFormState> emit) async {
    emit(state.copyWith(
        identificationType: event.identificationType, formKey: formKey));
  }

  Future<void> _onIdentificationNumberChanged(IdentificationNumberChanged event,
      Emitter<StudentPaymentFormState> emit) async {
    emit(state.copyWith(
        identificationNumber: event.identificationNumber, formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<StudentPaymentFormState> emit) async {
    /* print('cardNumber ${state.cardNumber}');
    print('expireDate ${state.expireDate}');
    print('CardHolderName ${state.cardHolderName}');
    print('cvv ${state.cvvCode}');
    print('identificationType ${state.identificationType}');
    print('identificationNumber ${state.identificationNumber}');*/

    print('Form data ${state.toCardTokenBody().toJson()}');
    emit(state.copyWith(response: Loading()));
    Resource response =
        await mercadoPagoUseCases.createCardToken.run(state.toCardTokenBody());
    emit(state.copyWith(response: response));
  }
}
