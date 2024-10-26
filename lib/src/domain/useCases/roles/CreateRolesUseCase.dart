import 'package:sppp/src/domain/models/Roles.dart';
import 'package:sppp/src/domain/repository/RolesRepository.dart';

class CreateRolesUseCase {
  RolesRepository rolesRepository;
  CreateRolesUseCase(this.rolesRepository);

  run(Roles roles) => rolesRepository.create(roles);
}
