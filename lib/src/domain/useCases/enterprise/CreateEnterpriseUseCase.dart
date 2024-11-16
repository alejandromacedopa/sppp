import 'dart:io';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/domain/repository/EnterpriseRepository.dart';

class CreateEnterpriseUseCase {
  EnterpriseRepository enterpriseRepository;
  CreateEnterpriseUseCase(this.enterpriseRepository);
  run(Enterprise enteprise, File file) => enterpriseRepository.create(enteprise, file);
}
