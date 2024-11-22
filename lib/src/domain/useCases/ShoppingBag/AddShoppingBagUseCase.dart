import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/models/ShoppingBagRepository.dart';

class AddShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  AddShoppingBagUseCase(this.shoppingBagRepository);

  run(Courses courses) => shoppingBagRepository.add(courses);
}
