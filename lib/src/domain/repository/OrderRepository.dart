import 'package:sppp/src/domain/models/Order.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

abstract class OrderRepository {
  Future<Resource<List<Order>>> getUserOrders(String idclient);
  Future<void> saveOrdersInSession(Order order);
  Future<Order?> getOrdersSession();
}
