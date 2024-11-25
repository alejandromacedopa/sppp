import 'package:sppp/src/domain/models/Activities.dart';
import 'package:sppp/src/domain/repository/ActivitiesRepository.dart';

class UpdateActivitiesUseCase {
  ActivitiesRepository activitiesRepository;

  UpdateActivitiesUseCase(this.activitiesRepository);

  run(int id, Activities activity) => activitiesRepository.update(id, activity);
}
