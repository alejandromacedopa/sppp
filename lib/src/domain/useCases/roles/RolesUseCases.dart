import 'package:sppp/src/domain/useCases/roles/CreateRolesUseCase.dart';
import 'package:sppp/src/domain/useCases/roles/GetRolesUseCases.dart';

class RolesUseCases {
  CreateRolesUseCase create;
  GetRolesUseCase getRoles;

  RolesUseCases({
    required this.create,
    required this.getRoles,
  });
}
