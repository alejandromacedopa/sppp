
import 'package:sppp/src/domain/useCases/category/CreateCategoryUseCase.dart';
import 'package:sppp/src/domain/useCases/category/DeleteCategoryUseCase.dart';
import 'package:sppp/src/domain/useCases/category/GetCategoryUseCase.dart';
import 'package:sppp/src/domain/useCases/category/UpdateCategoryUseCase.dart';

class CategoriesUseCases {
  CreateCategoriesUseCase create;
  GetCategoriesUseCase getCategories;
  UpdateCategoriesUseCase update;
  DeleteCategoriesUseCase delete;

  CategoriesUseCases({
    required this.create,
    required this.getCategories,
    required this.update,
    required this.delete
  });
}