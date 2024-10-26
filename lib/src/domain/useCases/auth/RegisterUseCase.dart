import 'package:sppp/src/domain/models/User.dart';
import 'package:sppp/src/domain/repository/AuthRepository.dart';

class RegisterUseCase {
  AuthRepository repository;

  RegisterUseCase(this.repository);
  run(User user) => repository.register(user);
}
