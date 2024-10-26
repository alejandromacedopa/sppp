import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sppp/src/data/api/ApiConfig.dart';
import 'package:sppp/src/domain/utils/ListToString.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/domain/models/Roles.dart';

class RolesService {
  Future<Resource<Roles>> create(Roles roles) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/roles');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode(roles.toJson());

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Roles roles = Roles.fromJson(data);
        return Success(roles);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Roles>>> getRoles() async {
    try {
      // hhtp://192.168.1.89:3000/roles
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/roles');
      Map<String, String> headers = {"Content-Type": "application/json"};
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Roles> roles = Roles.fromJsonList(data);
        return Success(roles);
      } else {
        //ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error $e');
      return Error(e.toString());
    }
  }
}
