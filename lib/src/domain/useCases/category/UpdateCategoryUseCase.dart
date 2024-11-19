import 'dart:io';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/domain/repository/CategoryRepository.dart';

class UpdateCategoriesUseCase {
  CategoriesRepository categoriesRepository;
  UpdateCategoriesUseCase(this.categoriesRepository);
  run(int id, Category category, File? file) => categoriesRepository.update(id, category, file);

}