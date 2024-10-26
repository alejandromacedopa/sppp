import 'package:sppp/src/data/dataSource/local/SharedPref.dart';
import 'package:sppp/src/data/dataSource/remote/services/AuthServices.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/domain/models/User.dart';
import 'package:sppp/src/domain/repository/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthServices authServices;
  SharedPref sharedPref;
  AuthRepositoryImpl(this.authServices, this.sharedPref);

  @override
  Future<AuthResponse?> getUsersSession() async {
    final data = await this.sharedPref.read('user');
    if (data != null) {
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authServices.login(email, password);
  }

  @override
  Future<bool> logout() async {
    return await sharedPref.remove('user');
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authServices.register(user);
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharedPref.save('user', authResponse.toJson());
  }

  @override
  Future<Resource<List<User>>> getUser() {
    return authServices.getUser();
  }
}
