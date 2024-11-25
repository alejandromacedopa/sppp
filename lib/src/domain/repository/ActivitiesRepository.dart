import 'package:sppp/src/domain/models/Activities.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

abstract class ActivitiesRepository {
  Future<Resource<Activities>> create(Activities activity);
  Future<Resource<List<Activities>>> getActivities();
  Future<Resource<Activities>> update(int id, Activities activity);
  Future<Resource<bool>> delete(int id);
}
