import 'package:sppp/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:sppp/src/domain/useCases/auth/GetUserUseCase.dart';
import 'package:sppp/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:sppp/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:sppp/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:sppp/src/domain/useCases/auth/SaveUserSessionUseCase.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;
  GetUserUseCase getUser;
  GetUserSessionUseCase getUserSession;
  SaveUserSessionUseCase saveUserSession;
  LogoutUseCase logout;
  AuthUseCases(
      {required this.login,
      required this.register,
      required this.getUser,
      required this.getUserSession,
      required this.logout,
      required this.saveUserSession});
}
