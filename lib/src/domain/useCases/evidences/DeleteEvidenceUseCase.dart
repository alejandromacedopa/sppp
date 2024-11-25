import 'package:sppp/src/domain/repository/EvidenceRepository.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class DeleteEvidenceUseCase {
  EvidenceRepository evidenceRepository;
  DeleteEvidenceUseCase(this.evidenceRepository);

  Future<Resource<bool>> run(int id) => evidenceRepository.delete(id);
}
