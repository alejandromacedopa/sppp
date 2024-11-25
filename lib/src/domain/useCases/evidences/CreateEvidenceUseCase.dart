import 'package:sppp/src/domain/models/Evidence.dart';
import 'package:sppp/src/domain/repository/EvidenceRepository.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class CreateEvidenceUseCase {
  EvidenceRepository evidenceRepository;
  CreateEvidenceUseCase(this.evidenceRepository);

  Future<Resource<Evidence>> run(Evidence evidence) =>
      evidenceRepository.create(evidence);
}
