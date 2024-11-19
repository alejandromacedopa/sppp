import 'dart:io';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/repository/CoursesRepository.dart';

class UpdateCoursesUseCase {
  CoursesRepository coursesRepository;

  UpdateCoursesUseCase(this.coursesRepository);

  run(int id, Courses courses, List<File>? files, List<int>? imagesToUpdate) =>
      coursesRepository.update(id, courses, files, imagesToUpdate);
}