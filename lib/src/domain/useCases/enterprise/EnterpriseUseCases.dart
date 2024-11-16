import 'package:sppp/src/domain/useCases/enterprise/CreateEnterpriseUseCase.dart';
import 'package:sppp/src/domain/useCases/enterprise/DeleteEnterpriseUseCase.dart';
import 'package:sppp/src/domain/useCases/enterprise/GetEnterpriseUseCases.dart';
import 'package:sppp/src/domain/useCases/enterprise/UpdateEnterpriseUseCase.dart';

class EnterpriseUseCases {
  CreateEnterpriseUseCase create;
  GetEnterpriseUseCase getEnterprise;
  UpdateEnterpriseUseCase update;
  DeleteEnterpriseUseCase delete;

  EnterpriseUseCases(
      {required this.create,
        required this.getEnterprise,
        required this.update,
        required this.delete});
}
