import 'package:equatable/equatable.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object?> get props => [];
}

class RegisterInitEvent extends RegisterEvent {
  const RegisterInitEvent();
}

class RegisterNameChanged extends RegisterEvent {
  final BlocFormItem name;
  const RegisterNameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class RegisterLastNameChanged extends RegisterEvent {
  final BlocFormItem lastname;
  const RegisterLastNameChanged({required this.lastname});
  @override
  List<Object?> get props => [lastname];
}

class RegisterEmailChanged extends RegisterEvent {
  final BlocFormItem email;
  const RegisterEmailChanged({required this.email});
  @override
  List<Object?> get props => [email];
}

class RegisterPhoneChanged extends RegisterEvent {
  final BlocFormItem phone;
  const RegisterPhoneChanged({required this.phone});
  @override
  List<Object?> get props => [phone];
}

class RegisterPasswordChanged extends RegisterEvent {
  final BlocFormItem password;
  const RegisterPasswordChanged({required this.password});
  @override
  List<Object?> get props => [password];
}

class RegisterConfirmPasswordChanged extends RegisterEvent {
  final BlocFormItem confirmpassword;
  const RegisterConfirmPasswordChanged({required this.confirmpassword});
  @override
  List<Object?> get props => [confirmpassword];
}

class RegisterFormSubmit extends RegisterEvent {
  const RegisterFormSubmit();
}

class RegisterFormReset extends RegisterEvent {
  const RegisterFormReset();
}
