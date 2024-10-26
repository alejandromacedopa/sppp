import 'package:sppp/src/domain/repository/AuthRepository.dart';

class GetUserUseCase {
  AuthRepository userRepository;
  GetUserUseCase(this.userRepository);

  run() => userRepository.getUser();
}
