import 'package:sppp/src/domain/repository/CoursesRepository.dart';

class GetCoursesByCategoryUseCase {
  CoursesRepository coursesRepository;

  GetCoursesByCategoryUseCase(this.coursesRepository);

  run(int idCategory) => coursesRepository.getCoursesByCategory(idCategory);
}