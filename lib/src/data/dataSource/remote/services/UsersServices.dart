import 'dart:convert';

import 'package:sppp/src/data/api/ApiConfig.dart';
import 'package:sppp/src/domain/models/User.dart';
import 'package:sppp/src/domain/utils/ListToString.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;

class UsersServices {
  Future<String> token;

  UsersServices(this.token);

  Future<Resource<List<User>>> getUsers() async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/user');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<User> user = User.fromJsonList(data);
        return Success(user);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<bool>> delete(int id) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/users/$id');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await http.delete(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}

