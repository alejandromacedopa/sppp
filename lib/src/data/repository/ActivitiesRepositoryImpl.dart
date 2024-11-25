import 'package:sppp/src/data/dataSource/remote/services/ActivitiesServices.dart';
import 'package:sppp/src/domain/models/Activities.dart';
import 'package:sppp/src/domain/repository/ActivitiesRepository.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class ActivitiesRepositoryImpl implements ActivitiesRepository {
  ActivitiesService activitiesService;

  ActivitiesRepositoryImpl(this.activitiesService);

  @override
  Future<Resource<Activities>> create(Activities activity) {
    return activitiesService.create(activity);
  }

  @override
  Future<Resource<List<Activities>>> getActivities() {
    return activitiesService.getActivities();
  }

  @override
  Future<Resource<Activities>> update(int id, Activities activity) {
    return activitiesService.update(id, activity);
  }

  @override
  Future<Resource<bool>> delete(int id) {
    return activitiesService.delete(id);
  }
}
