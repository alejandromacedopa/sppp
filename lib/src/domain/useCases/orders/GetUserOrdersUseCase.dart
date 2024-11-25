import 'package:sppp/src/domain/repository/OrderRepository.dart';

class GetUserOrdersUseCase {
  OrderRepository orderRepository;

  GetUserOrdersUseCase(this.orderRepository);

  run(String idclient) => orderRepository.getUserOrders(idclient);
}
