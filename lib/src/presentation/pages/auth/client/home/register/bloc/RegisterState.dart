import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:sppp/src/domain/models/User.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmpassword;
  final Resource? response;

  final GlobalKey<FormState>? formKey;

  const RegisterState(
      {this.name = const BlocFormItem(error: 'Ingresa el nombre'),
      this.lastname = const BlocFormItem(error: 'Ingresa el apellido'),
      this.email = const BlocFormItem(error: 'Ingresa email'),
      this.phone = const BlocFormItem(error: 'Ingresa el telefono'),
      this.password = const BlocFormItem(error: 'Ingrese su password'),
      this.confirmpassword =
          const BlocFormItem(error: 'Ingrese la confirmacion del password'),
      this.formKey,
      this.response});

  toUser() => User(
      name: name.value,
      lastname: lastname.value,
      email: email.value,
      phone: phone.value,
      password: password.value);

  RegisterState copyWith({
    BlocFormItem? name,
    lastname,
    email,
    phone,
    password,
    confirmpassword,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return RegisterState(
        name: name ?? this.name,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        confirmpassword: confirmpassword ?? this.confirmpassword,
        formKey: formKey,
        response: response);
  }

  @override
  List<Object?> get props =>
      [name, lastname, email, phone, password, confirmpassword, response];
}
