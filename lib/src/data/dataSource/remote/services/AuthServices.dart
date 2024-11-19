import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:sppp/src/data/api/ApiConfig.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/domain/models/User.dart';

class AuthServices {


  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      //print('email:$email');
      //print('password:$password');
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/auth/login');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode({
        'email': email,
        'password': password,
      });

      final response = await https.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);
      } else {
        return Error(data['message']);
      }
    } catch (e) {
      print('Error $e');
      return Error(e.toString());
    }
  }

  Future<Resource<AuthResponse>> register(User user) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/auth/register');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode(user);

      final response = await https.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);
      } else {
        return Error(data['message']);
      }
    } catch (e) {
      print('Error $e');
      return Error(e.toString());
    }
  }
}
