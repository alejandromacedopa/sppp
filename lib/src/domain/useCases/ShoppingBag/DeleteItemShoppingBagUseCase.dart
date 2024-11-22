import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/models/ShoppingBagRepository.dart';

class DeleteItemShoppinBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  DeleteItemShoppinBagUseCase(this.shoppingBagRepository);

  run(Courses courses) => shoppingBagRepository.deleteItem(courses);
}
