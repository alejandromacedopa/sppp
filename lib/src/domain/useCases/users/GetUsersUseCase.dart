import 'package:sppp/src/domain/repository/UsersRepository.dart';

class GetUsersUseCase {
  UsersRepository usersRepository;
  GetUsersUseCase(this.usersRepository);
  run() => usersRepository.getUsers();
}