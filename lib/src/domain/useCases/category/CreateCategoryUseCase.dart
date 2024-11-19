import 'dart:io';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/domain/repository/CategoryRepository.dart';

class CreateCategoriesUseCase {
  CategoriesRepository categoriesRepository;
  CreateCategoriesUseCase(this.categoriesRepository);
  run(Category category, File file) => categoriesRepository.create(category, file);
}