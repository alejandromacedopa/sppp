import 'dart:convert';
import 'dart:io';
import 'package:sppp/src/data/api/ApiConfig.dart';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/domain/utils/ListToString.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class EnterpriseService {
  Future<String> token;

  EnterpriseService(this.token);

  Future<Resource<Enterprise>> create(Enterprise enterprise, File file) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/enterprise');
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = await token;
      request.files.add(http.MultipartFile(
          'file', http.ByteStream(file.openRead().cast()), await file.length(),
          filename: basename(file.path),
          contentType: MediaType('logoImageUrl', 'jpg')));
      request.fields['name'] = enterprise.name;
      request.fields['supervisor'] = enterprise.supervisor;
      final response = await request.send();
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Enterprise enterpriseResponse = Enterprise.fromJson(data);
        return Success(enterpriseResponse);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Enterprise>> update(int id, Enterprise enterprise) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/enterprise/$id');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode({
        'name': enterprise.name,
        'supervisor': enterprise.supervisor,
      });
      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Enterprise enterpriseResponse = Enterprise.fromJson(data);
        return Success(enterpriseResponse);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Enterprise>> updateImage(
      int id, Enterprise enterprise, File file) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/enterprise/upload/$id');
      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = await token;
      request.files.add(http.MultipartFile(
          'file', http.ByteStream(file.openRead().cast()), await file.length(),
          filename: basename(file.path),
          contentType: MediaType('logoImageUrl', 'jpg')));
      request.fields['name'] = enterprise.name;
      request.fields['supervisor'] = enterprise.supervisor;
      final response = await request.send();
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Enterprise enterpriseResponse = Enterprise.fromJson(data);
        return Success(enterpriseResponse);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Enterprise>>> getEnterprise() async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/enterprise');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Enterprise> enterprise = Enterprise.fromJsonList(data);
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

  Future<Resource<bool>> delete(int id) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/enterprise/$id');
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
