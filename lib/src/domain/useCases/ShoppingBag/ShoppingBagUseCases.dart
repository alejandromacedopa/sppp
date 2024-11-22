
import 'package:sppp/src/domain/useCases/ShoppingBag/AddShoppingBagUseCase.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/GetCoursesShoppingBagUseCase.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/GetTotalShoppingBagUseCase.dart';

class ShoppingBagUseCases {
  AddShoppingBagUseCase add;
  GetCoursesShoppingBagUseCase getCourses;
  DeleteItemShoppinBagUseCase deleteItem;
  deleteShoppingBagUseCase deleteShoppingBag;
  GetTotalShoppingBagUseCase getTotal;

  ShoppingBagUseCases({
    required this.add,
    required this.getCourses,
    required this.deleteItem,
    required this.deleteShoppingBag,
    required this.getTotal,
  });
}
