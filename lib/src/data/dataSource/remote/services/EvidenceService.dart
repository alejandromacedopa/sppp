import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:sppp/src/data/api/ApiConfig.dart';
import 'package:sppp/src/domain/models/Evidence.dart';
import 'package:sppp/src/domain/utils/ListToString.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class EvidenceService {
  Future<String> token;

  EvidenceService(this.token);

  Future<Resource<Evidence>> create(Evidence evidence) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/evidence');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      String body = evidenceToJson(evidence);
      final response = await https.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Evidence evidenceResponse = Evidence.fromJson(data);
        return Success(evidenceResponse);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<List<Evidence>>> getEvidences() async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/evidence');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await https.get(url, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Evidence> evidences = List<Evidence>.from(
            (data as List).map((item) => Evidence.fromJson(item)));
        return Success(evidences);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<Evidence>> update(int id, Evidence evidence) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/evidence/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      String body = evidenceToJson(evidence);
      final response = await https.put(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Evidence evidenceResponse = Evidence.fromJson(data);
        return Success(evidenceResponse);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<bool>> delete(int id) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/evidence/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await https.delete(url, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }
}
