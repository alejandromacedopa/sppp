import 'package:sppp/src/domain/repository/CategoryRepository.dart';

class GetCategoriesUseCase {
  CategoriesRepository categoriesRepository;
  GetCategoriesUseCase(this.categoriesRepository);
  run()=> categoriesRepository.getCategories();

}