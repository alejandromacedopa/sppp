import 'package:sppp/src/domain/repository/RolesRepository.dart';

class GetRolesUseCase {
  RolesRepository rolesRepository;
  GetRolesUseCase(this.rolesRepository);

  run() => rolesRepository.getRoles();
}
