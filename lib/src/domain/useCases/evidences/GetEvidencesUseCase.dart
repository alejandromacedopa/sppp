import 'package:sppp/src/domain/repository/EvidenceRepository.dart';
import 'package:sppp/src/domain/models/Evidence.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class GetEvidencesUseCase {
  EvidenceRepository evidenceRepository;
  GetEvidencesUseCase(this.evidenceRepository);

  Future<Resource<List<Evidence>>> run() => evidenceRepository.getEvidences();
}
