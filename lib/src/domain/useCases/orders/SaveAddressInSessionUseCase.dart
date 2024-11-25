import 'package:sppp/src/domain/models/Order.dart';
import 'package:sppp/src/domain/repository/OrderRepository.dart';

class SaveOrdersInSessionUseCase {
  OrderRepository orderRepository;

  SaveOrdersInSessionUseCase(this.orderRepository);

  run(Order order) => orderRepository.saveOrdersInSession(order);
}
