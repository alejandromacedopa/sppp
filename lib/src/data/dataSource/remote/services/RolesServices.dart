import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as https;
import 'package:sppp/src/data/api/ApiConfig.dart';
import 'package:sppp/src/data/dataSource/remote/services/EnterpriseServices.dart';
import 'package:sppp/src/domain/utils/ListToString.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/domain/models/Roles.dart';
import 'package:path/path.dart';

class RolesService {
  Future<String> token;

  RolesService(this.token);

  Future<Resource<Roles>> create(Roles roles) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/rol');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode(roles.toJson());

      final response = await https.post(url, headers: headers, body: body);
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
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/rol');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await https.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Roles> enterprise = Roles.fromJsonList(data);
        return Success(enterprise);
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
