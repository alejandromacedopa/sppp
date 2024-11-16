import 'package:sppp/src/domain/repository/EnterpriseRepository.dart';

class DeleteEnterpriseUseCase {
  EnterpriseRepository enterpriseRepository;
  DeleteEnterpriseUseCase(this.enterpriseRepository);
  run(int id) => enterpriseRepository.delete(id);
}
