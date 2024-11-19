import 'package:sppp/src/domain/useCases/users/DeleteUsersUseCase.dart';
import 'package:sppp/src/domain/useCases/users/GetUsersUseCase.dart';

class UsersUseCases {
  GetUsersUseCase getUsers;
  DeleteUsersUseCase delete;

  UsersUseCases(
      {required this.getUsers,
        required this.delete
        });
}