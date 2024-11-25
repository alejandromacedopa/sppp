import 'package:sppp/src/data/dataSource/remote/services/EvidenceService.dart';
import 'package:sppp/src/domain/models/Evidence.dart';
import 'package:sppp/src/domain/repository/EvidenceRepository.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class EvidenceRepositoryImpl implements EvidenceRepository {
  final EvidenceService evidenceService;

  EvidenceRepositoryImpl(this.evidenceService);

  @override
  Future<Resource<Evidence>> create(Evidence evidence) {
    return evidenceService.create(evidence);
  }

  @override
  Future<Resource<bool>> delete(int id) {
    return evidenceService.delete(id);
  }

  @override
  Future<Resource<List<Evidence>>> getEvidences() {
    return evidenceService.getEvidences();
  }

  @override
  Future<Resource<Evidence>> update(int id, Evidence evidence) {
    return evidenceService.update(id, evidence);
  }
}
