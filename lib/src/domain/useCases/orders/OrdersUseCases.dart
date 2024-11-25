
import 'package:sppp/src/domain/useCases/orders/GetOrdersSessionUseCase.dart';
import 'package:sppp/src/domain/useCases/orders/GetUserOrdersUseCase.dart';
import 'package:sppp/src/domain/useCases/orders/SaveAddressInSessionUseCase.dart';

class OrdersUseCases {
  GetUserOrdersUseCase getUserOrders;
  SaveOrdersInSessionUseCase saveOrdersInSession;
  GetOrdersSessionUseCase getOrdersSession;

  OrdersUseCases({
    required this.getUserOrders,
    required this.saveOrdersInSession,
    required this.getOrdersSession,
  });
}
