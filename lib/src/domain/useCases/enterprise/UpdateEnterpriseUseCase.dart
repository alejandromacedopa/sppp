import 'dart:io';

import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/domain/repository/EnterpriseRepository.dart';

class UpdateEnterpriseUseCase {
  EnterpriseRepository enterpriseRepository;
  UpdateEnterpriseUseCase(this.enterpriseRepository);
  run(int id, Enterprise enterprise, File? file) => enterpriseRepository.update(id, enterprise, file);
}