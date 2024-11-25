import 'package:sppp/src/domain/models/Evidence.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

abstract class EvidenceRepository {
  Future<Resource<Evidence>> create(Evidence evidence);
  Future<Resource<Evidence>> update(int id, Evidence evidence);
  Future<Resource<List<Evidence>>> getEvidences();
  Future<Resource<bool>> delete(int id);
}
