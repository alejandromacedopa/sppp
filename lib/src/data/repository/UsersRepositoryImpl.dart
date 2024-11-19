import 'package:sppp/src/data/dataSource/remote/services/UsersServices.dart';
import 'package:sppp/src/domain/models/User.dart';
import 'package:sppp/src/domain/repository/UsersRepository.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersServices usersServices;

  UsersRepositoryImpl(this.usersServices);

  @override
  Future<Resource<List<User>>> getUsers() {
    return usersServices.getUsers();
  }
  @override
  Future<Resource<bool>> delete(int id) {
    return usersServices.delete(id);
  }
}