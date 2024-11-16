import 'dart:io';
import 'package:sppp/src/data/dataSource/remote/services/EnterpriseServices.dart';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/domain/repository/EnterpriseRepository.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class EnterpriseRepositoryimpl implements EnterpriseRepository {
  EnterpriseService enterpriseService;

  EnterpriseRepositoryimpl(this.enterpriseService);

  @override
  Future<Resource<Enterprise>> create(Enterprise enterprise, File file) {
    return enterpriseService.create(enterprise, file);
  }

  @override
  Future<Resource<bool>> delete(int id) {
    return enterpriseService.delete(id);
  }

  @override
  Future<Resource<List<Enterprise>>> getEnterprise() {
    return enterpriseService.getEnterprise();
  }

  @override
  Future<Resource<Enterprise>> update(int id, Enterprise enterprise, File? file) {
    if (file == null) {
      return enterpriseService.update(id, enterprise);
    } else {
      return enterpriseService.updateImage(id, enterprise, file);
    }
  }
}