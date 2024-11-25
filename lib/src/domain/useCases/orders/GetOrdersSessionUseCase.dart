
import 'package:sppp/src/domain/repository/OrderRepository.dart';

class GetOrdersSessionUseCase {
  OrderRepository orderRepository;

  GetOrdersSessionUseCase(this.orderRepository);

  run() => orderRepository.getOrdersSession();
}
