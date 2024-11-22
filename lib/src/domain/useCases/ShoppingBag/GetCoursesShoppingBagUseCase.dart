import 'package:sppp/src/domain/models/ShoppingBagRepository.dart';
class GetCoursesShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  GetCoursesShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.getCourses();
}
