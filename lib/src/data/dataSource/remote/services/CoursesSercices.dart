import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as https;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:sppp/src/data/api/ApiConfig.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/utils/ListToString.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class CoursesService {
  Future<String> token;

  CoursesService(this.token);

  Future<Resource<Courses>> create(Courses courses, List<File> files) async {
    try {
      // http://192.168.80.13:3000/users/5
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/courses');

      final request = https.MultipartRequest('POST', url);
      request.headers['Authorization'] = await token;
      files.forEach((file) async {
        request.files.add(https.MultipartFile('files[]',
            https.ByteStream(file.openRead().cast()), await file.length(),
            filename: basename(file.path),
            contentType: MediaType('image', 'jpg')));
      });
      request.fields['name'] = courses.name;
      request.fields['description'] = courses.description;
      request.fields['price'] = courses.price.toString();
      request.fields['id_category'] = courses.idCategory.toString();
      final response = await request.send();
      final data =
      json.decode(await response.stream.transform(utf8.decoder).first);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Courses coursesResponse = Courses.fromJson(data);
        return Success(coursesResponse);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Courses>>> getCoursesByCategory(int idCategory) async {
    try {
      Uri url =
      Uri.https(ApiConfig.API_ECOMMERCE, '/courses/category/$idCategory');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await https.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Courses> courses = Courses.fromJsonList(data);
        return Success(courses);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Courses>> update(int id, Courses courses) async {
    try {
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/courses/$id');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode({
        'name': courses.name,
        'description': courses.description,
        'price': courses.price,
      });
      final response = await https.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Courses coursesResponse = Courses.fromJson(data);
        return Success(coursesResponse);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Courses>> updateImage(int id, Courses courses,
      List<File> files, List<int> imagesToUpdate) async {
    try {
      // http://192.168.80.13:3000/users/5
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/courses/upload/$id');

      final request = https.MultipartRequest('PUT', url);
      request.headers['Authorization'] = await token;
      files.forEach((file) async {
        request.files.add(https.MultipartFile('files[]',
            https.ByteStream(file.openRead().cast()), await file.length(),
            filename: basename(file.path),
            contentType: MediaType('image', 'jpg')));
      });
      request.fields['name'] = courses.name;
      request.fields['description'] = courses.description;
      request.fields['price'] = courses.price.toString();
      request.fields['images_to_update'] =
          json.encode(imagesToUpdate); // ['0', '1']
      final response = await request.send();
      final data =
      json.decode(await response.stream.transform(utf8.decoder).first);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Courses coursesResponse = Courses.fromJson(data);
        return Success(coursesResponse);
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
      Uri url = Uri.https(ApiConfig.API_ECOMMERCE, '/courses/$id');
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