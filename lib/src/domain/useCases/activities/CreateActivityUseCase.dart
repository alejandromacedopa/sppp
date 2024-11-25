import 'package:sppp/src/domain/models/Activities.dart';
import 'package:sppp/src/domain/repository/ActivitiesRepository.dart';

class CreateActivitiesUseCase {
  ActivitiesRepository activitiesRepository;

  CreateActivitiesUseCase(this.activitiesRepository);

  run(Activities activity) => activitiesRepository.create(activity);
}
