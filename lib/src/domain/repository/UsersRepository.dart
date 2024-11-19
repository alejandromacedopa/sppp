import 'package:sppp/src/domain/models/User.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

abstract class UsersRepository {
  Future<Resource<List<User>>> getUsers();
  Future<Resource<bool>> delete(int id);
}