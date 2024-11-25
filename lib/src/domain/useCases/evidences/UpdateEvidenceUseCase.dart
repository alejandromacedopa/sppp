import 'package:sppp/src/domain/models/Evidence.dart';
import 'package:sppp/src/domain/repository/EvidenceRepository.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class UpdateEvidenceUseCase {
  EvidenceRepository evidenceRepository;
  UpdateEvidenceUseCase(this.evidenceRepository);

  Future<Resource<Evidence>> run(int id, Evidence evidence) =>
      evidenceRepository.update(id, evidence);
}
