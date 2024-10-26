import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/domain/models/User.dart';

abstract class AuthRepository {
  //METODOS
  Future<AuthResponse?> getUsersSession();
  Future<bool> logout();
  Future<Resource<List<User>>> getUser();
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User user);
}
