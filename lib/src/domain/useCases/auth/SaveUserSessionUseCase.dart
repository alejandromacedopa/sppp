import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/domain/repository/AuthRepository.dart';

class SaveUserSessionUseCase {
  AuthRepository authRepository;
  SaveUserSessionUseCase(this.authRepository);
  run(AuthResponse authResponse) =>
      authRepository.saveUserSession(authResponse);
}
