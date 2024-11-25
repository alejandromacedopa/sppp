import 'package:sppp/src/domain/useCases/activities/CreateActivityUseCase.dart';
import 'package:sppp/src/domain/useCases/activities/DeleteActivityUseCase.dart';
import 'package:sppp/src/domain/useCases/activities/GetActivitiesUseCase.dart';
import 'package:sppp/src/domain/useCases/activities/UpdateActivitiesUseCase.dart';

class ActivitiesUseCases {
  CreateActivitiesUseCase create;
  GetActivitiesUseCase getActivities;
  UpdateActivitiesUseCase update;
  DeleteActivityUseCase delete;

  ActivitiesUseCases({
    required this.create,
    required this.getActivities,
    required this.update,
    required this.delete,
  });
}
