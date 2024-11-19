import 'package:sppp/src/domain/repository/CategoryRepository.dart';

class DeleteCategoriesUseCase {
  CategoriesRepository categoriesRepository;
  DeleteCategoriesUseCase(this.categoriesRepository);
  run(int id) => categoriesRepository.delete(id);
}