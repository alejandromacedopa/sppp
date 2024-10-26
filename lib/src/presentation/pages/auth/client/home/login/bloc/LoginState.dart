import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class LoginState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  const LoginState(
      {this.email = const BlocFormItem(error: 'Ingresa Email'),
      this.password = const BlocFormItem(error: 'Ingresa Contraseña'),
      this.formKey,
      this.response});

  LoginState copyWith(
      {BlocFormItem? email,
      password,
      Resource? response,
      GlobalKey<FormState>? formKey}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [email, password, response];
}
