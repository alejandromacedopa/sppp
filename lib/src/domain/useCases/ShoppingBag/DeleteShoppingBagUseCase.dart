import 'package:sppp/src/domain/models/ShoppingBagRepository.dart';

class deleteShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  deleteShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.deleteShoppingBag();
}
