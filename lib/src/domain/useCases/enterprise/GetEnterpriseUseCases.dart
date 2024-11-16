import 'package:sppp/src/domain/repository/EnterpriseRepository.dart';

class GetEnterpriseUseCase {
  EnterpriseRepository enterpriseRepository;
  GetEnterpriseUseCase(this.enterpriseRepository);
  run() => enterpriseRepository.getEnterprise();
}
