import 'package:sppp/src/domain/useCases/evidences/CreateEvidenceUseCase.dart';
import 'package:sppp/src/domain/useCases/evidences/DeleteEvidenceUseCase.dart';
import 'package:sppp/src/domain/useCases/evidences/GetEvidencesUseCase.dart';
import 'package:sppp/src/domain/useCases/evidences/UpdateEvidenceUseCase.dart';

class EvidenceUseCases {
  CreateEvidenceUseCase create;
  GetEvidencesUseCase getEvidences;
  UpdateEvidenceUseCase update;
  DeleteEvidenceUseCase delete;

  EvidenceUseCases({
    required this.create,
    required this.getEvidences,
    required this.update,
    required this.delete,
  });
}
