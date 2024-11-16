import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class InitEvent extends LoginEvent {
  const InitEvent();
}

class EmailChanged extends LoginEvent {
  final BlocFormItem email;
  const EmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final BlocFormItem password;
  const PasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class LoginSubmit extends LoginEvent {
  const LoginSubmit();
}

class LoginSaveSession extends LoginEvent {
  final AuthResponse authResponse;
  const LoginSaveSession({required this.authResponse});

  @override
  List<Object?> get props => [authResponse];
}

class LoginFormReset extends LoginEvent {
  const LoginFormReset();
}
