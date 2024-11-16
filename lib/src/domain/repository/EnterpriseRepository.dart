import 'dart:io';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

abstract class EnterpriseRepository {
  Future<Resource<Enterprise>> create(Enterprise enterprise, File file);
  Future<Resource<Enterprise>> update(int id, Enterprise enterprise, File? file);
  Future<Resource<List<Enterprise>>> getEnterprise();
  Future<Resource<bool>> delete(int id);
}