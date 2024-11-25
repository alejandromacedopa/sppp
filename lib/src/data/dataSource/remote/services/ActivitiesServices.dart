import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:sppp/src/data/api/ApiConfig.dart';
import 'package:sppp/src/domain/models/Activities.dart';
import 'package:sppp/src/domain/utils/ListToString.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class ActivitiesService {
  Future<String> token;

  ActivitiesService(this.token);

  Future<Resource<Activities>> create(Activities activity) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/activity');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      String body = activitiesToJson(activity);
      final response = await https.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Activities activityResponse = Activities.fromJson(data);
        return Success(activityResponse);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<List<Activities>>> getActivities() async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/activity');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await https.get(url, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Activities> activities = Activities.fromJsonList(data);
        return Success(activities);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<Activities>> update(int id, Activities activity) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/activity/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      String body = activitiesToJson(activity);
      final response = await https.put(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Activities activityResponse = Activities.fromJson(data);
        return Success(activityResponse);
      } else {
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<bool>> delete(int id) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/activity/$id');

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
