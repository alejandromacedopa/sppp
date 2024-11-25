import 'package:sppp/src/domain/repository/ActivitiesRepository.dart';

class DeleteActivityUseCase {
  final ActivitiesRepository repository;

  DeleteActivityUseCase(this.repository);

  Future run(int id) => repository.delete(id);
}
