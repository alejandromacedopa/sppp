import 'package:sppp/src/domain/repository/CoursesRepository.dart';

class DeleteCoursesUseCase {
  CoursesRepository coursesRepository;

  DeleteCoursesUseCase(this.coursesRepository);

  run(int id) => coursesRepository.delete(id);
}