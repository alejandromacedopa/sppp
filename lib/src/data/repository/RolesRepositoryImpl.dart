import 'package:sppp/src/data/dataSource/remote/services/RolesServices.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/domain/models/Roles.dart';
import 'package:sppp/src/domain/repository/RolesRepository.dart';

class RolesRepositoryImpl implements RolesRepository {
  RolesService rolesService;
  RolesRepositoryImpl(this.rolesService);
  @override
  Future<Resource<Roles>> create(Roles roles) {
    return rolesService.create(roles);
  }

   @override
  Future<Resource<List<Roles>>> getRoles() {
    return rolesService.getRoles();
  }
}
