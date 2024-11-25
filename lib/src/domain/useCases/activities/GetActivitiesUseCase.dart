import 'package:sppp/src/domain/repository/ActivitiesRepository.dart';

class GetActivitiesUseCase {
  ActivitiesRepository activitiesRepository;

  GetActivitiesUseCase(this.activitiesRepository);

  run() => activitiesRepository.getActivities();
}
