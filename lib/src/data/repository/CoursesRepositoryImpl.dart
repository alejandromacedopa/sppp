import 'dart:io';

import 'package:sppp/src/data/dataSource/remote/services/CoursesSercices.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/repository/CoursesRepository.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  CoursesService coursesService;

  CoursesRepositoryImpl(this.coursesService);
  @override
  Future<Resource<Courses>> create(Courses product, List<File> files) {
    return coursesService.create(product, files);
  }

  @override
  Future<Resource<bool>> delete(int id) {
    return coursesService.delete(id);
  }

  @override
  Future<Resource<List<Courses>>> getCoursesByCategory(int idCategory) {
    return coursesService.getCoursesByCategory(idCategory);
  }

  @override
  Future<Resource<Courses>> update(
      int id, Courses courses, List<File>? files, List<int>? imagesToUpdate) {
    if (files != null && imagesToUpdate != null) {
      return coursesService.updateImage(id, courses, files, imagesToUpdate);
    } else {
      return coursesService.update(id, courses);
    }
  }
}