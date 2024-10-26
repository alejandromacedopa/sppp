import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/register/bloc/RegisterEvent.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/register/bloc/RegisterState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthUseCases authUseCases;

  RegisterBloc(this.authUseCases) : super(RegisterState()) {
    on<RegisterInitEvent>(_onInitEvent);
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterLastNameChanged>(_onLastNameChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPhoneChanged>(_onPhoneChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterConfirmPasswordChanged>(_onConfirPasswordChanged);
    on<RegisterFormSubmit>(_onRegisterSubmit);
    on<RegisterFormReset>(_onRegisterFormReset);
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(
      RegisterInitEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChanged(
      RegisterNameChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'Ingresa nombre'),
        formKey: formKey));
  }

  Future<void> _onLastNameChanged(
      RegisterLastNameChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        lastname: BlocFormItem(
            value: event.lastname.value,
            error:
                event.lastname.value.isNotEmpty ? null : 'Ingresa apellidos'),
        formKey: formKey));
  }

  Future<void> _onEmailChanged(
      RegisterEmailChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isNotEmpty ? null : 'Ingresa email'),
        formKey: formKey));
  }

  Future<void> _onPhoneChanged(
      RegisterPhoneChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        phone: BlocFormItem(
            value: event.phone.value,
            error: event.phone.value.isNotEmpty ? null : 'Ingresa telefono'),
        formKey: formKey));
  }

  Future<void> _onPasswordChanged(
      RegisterPasswordChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        password: BlocFormItem(
            value: event.password.value,
            error:
                event.password.value.isNotEmpty ? null : 'Ingresa el password'),
        formKey: formKey));
  }

  Future<void> _onConfirPasswordChanged(
      RegisterConfirmPasswordChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        confirmpassword: BlocFormItem(
            value: event.confirmpassword.value,
            error: event.confirmpassword.value.isNotEmpty
                ? null
                : 'Ingresa la confirmacion del password'),
        formKey: formKey));
  }

  Future<void> _onRegisterSubmit(
      RegisterFormSubmit event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(response: Loading(), formKey: formKey),
    );
    await Future.delayed(Duration(seconds: 6));
    Resource response = await authUseCases.register.run(state.toUser());
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onRegisterFormReset(
      RegisterFormReset event, Emitter<RegisterState> emit) async {
    state.formKey?.currentState?.reset();
  }
}
