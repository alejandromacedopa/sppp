

import 'package:sppp/src/data/dataSource/local/SharedPref.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/models/ShoppingBagRepository.dart';

class ShoppingBagRepositoryImpl implements ShoppingBagRepository {
  SharedPref sharedPref;

  ShoppingBagRepositoryImpl(this.sharedPref);

  @override
  Future<void> add(Courses courses) async {
    final data = await sharedPref.read('shopping_bag');
    List<Courses> selectedCourses = [];
    if (data == null) {
      selectedCourses.add(courses);
      await sharedPref.save('shopping_bag', selectedCourses);
    } else {
      selectedCourses = Courses.fromJsonList(data).toList();
      int index = selectedCourses.indexWhere((p) => p.id == courses.id);
      if (index == -1) {
        // EL PRODUCTO NO EXISTE EN LA BOLSA DE COMPRAS (AñADIR)
        courses.quantity ??= 1;
        selectedCourses.add(courses);
      } else {
        // YA EXISTE EL PRODUCTO DENTRO DE LA LISTA (ACTUALIZAR)
        selectedCourses[index].quantity = courses.quantity;
      }
      await sharedPref.save('shopping_bag', selectedCourses);
    }
  }

  @override
  Future<void> deleteItem(Courses courses) async {
    final data = await sharedPref.read('shopping_bag');
    if (data == null) {
      return;
    }
    List<Courses> selectedCourses = Courses.fromJsonList(data).toList();
    selectedCourses.removeWhere((p) => p.id == courses.id);
    await sharedPref.save('shopping_bag', selectedCourses);
  }

  @override
  Future<void> deleteShoppingBag() async {
    await sharedPref.remove('shopping_bag');
  }

  @override
  Future<List<Courses>> getCourses() async {
    final data = await sharedPref.read('shopping_bag');
    if (data == null) {
      return [];
    }
    List<Courses> selectedCourses = Courses.fromJsonList(data).toList();
    return selectedCourses;
  }

  @override
  Future<double> getTotal() async {
    final data = await sharedPref.read('shopping_bag');
    if (data == null) {
      return 0;
    }
    double total = 0;
    List<Courses> selectedCourses = Courses.fromJsonList(data).toList();
    selectedCourses.forEach((product) {
      total = total + (product.quantity! * product.price);
    });
    return total;
  }
}
