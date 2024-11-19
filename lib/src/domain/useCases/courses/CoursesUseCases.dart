import 'package:sppp/src/domain/useCases/courses/CreateCoursesUseCase.dart';
import 'package:sppp/src/domain/useCases/courses/DeleteCoursesUseCase.dart';
import 'package:sppp/src/domain/useCases/courses/GetCoursesByCategoryUseCase.dart';
import 'package:sppp/src/domain/useCases/courses/UpdateCoursesUseCase.dart';

class CoursesUseCases {
  CreateCoursesUseCase create;
  GetCoursesByCategoryUseCase getCoursesByCategory;
  UpdateCoursesUseCase update;
  DeleteCoursesUseCase delete;

  CoursesUseCases({
    required this.create,
    required this.getCoursesByCategory,
    required this.update,
    required this.delete,
  });
}