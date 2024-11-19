import 'dart:io';

import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

abstract class CoursesRepository {
  Future<Resource<Courses>> create(Courses courses, List<File> files);
  Future<Resource<List<Courses>>> getCoursesByCategory(int idCategory);
  Future<Resource<Courses>> update(
      int id, Courses courses, List<File>? files, List<int>? imagesToUpdate);
  Future<Resource<bool>> delete(int id);
}