import 'dart:io';

import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/repository/CoursesRepository.dart';

class CreateCoursesUseCase {
  CoursesRepository coursesRepository;

  CreateCoursesUseCase(this.coursesRepository);

  run(Courses courses, List<File> files) =>
      coursesRepository.create(courses, files);
}