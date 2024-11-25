import 'package:sppp/src/data/dataSource/local/SharedPref.dart';
import 'package:sppp/src/data/dataSource/remote/services/OrderServices.dart';
import 'package:sppp/src/domain/models/Order.dart';
import 'package:sppp/src/domain/repository/OrderRepository.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class OrderRepositoryImpl implements OrderRepository {
  OrderService orderService;
  SharedPref sharedPref;

  OrderRepositoryImpl(this.orderService, this.sharedPref);

  @override
  Future<Resource<List<Order>>> getUserOrders(String idclient) {
    return orderService.getUserOrder(idclient);
  }

  @override
  Future<void> saveOrdersInSession(Order order) async {
    await sharedPref.save('order', order.toJson());
  }

  @override
  Future<Order?> getOrdersSession() async {
    final data = await sharedPref.read('order');
    if (data != null) {
      Order order = Order.fromJson(data);
      return order;
    }
    return null;
  }
  
}