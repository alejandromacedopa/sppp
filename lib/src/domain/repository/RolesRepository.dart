import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/domain/models/Roles.dart';

abstract class RolesRepository {
  //Metodos de Roles
  Future<Resource<Roles>> create(Roles rol);
  Future<Resource<List<Roles>>> getRoles();
}
