import 'package:sppp/src/domain/models/Courses.dart';

abstract class ShoppingBagRepository {
  Future<void> add(Courses courses);
  Future<List<Courses>> getCourses();
  Future<void> deleteItem(Courses courses);
  Future<void> deleteShoppingBag();
  Future<double> getTotal();
}
