import 'package:sppp/src/domain/repository/UsersRepository.dart';

class DeleteUsersUseCase {
  UsersRepository usersRepository;
  DeleteUsersUseCase(this.usersRepository);
  run(int id) => usersRepository.delete(id);
}