import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:sppp/src/data/api/ApiConfig.dart';
import 'package:sppp/src/domain/models/Address.dart';
import 'package:sppp/src/domain/utils/ListToString.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class AddressService {
  Future<String> token;

  AddressService(this.token);

  Future<Resource<Address>> create(Address address) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/address');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode(address.toJson());
      final response = await https.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      print('Status code: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Address addressResponse = Address.fromJson(data);
        return Success(addressResponse);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Address>>> getUserAddress(String idUser) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/address/user/$idUser');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await https.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Address> address = Address.fromJsonList(data);
        print('Address: ${address}');
        return Success(address);
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
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/address/$id');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await https.delete(url, headers: headers);
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
