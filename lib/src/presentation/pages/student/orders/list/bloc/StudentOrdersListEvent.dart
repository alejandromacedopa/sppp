import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/Order.dart';

abstract class StudentOrdersListEvent extends Equatable {
  const StudentOrdersListEvent();
  @override
  List<Object?> get props => [];
}

class GetUserOrders extends StudentOrdersListEvent {
  const GetUserOrders();
}

class ChangeRadioValue extends StudentOrdersListEvent {
  final int radioValue;
  final Order order;

  ChangeRadioValue({required this.radioValue, required this.order});

  @override
  // TODO: implement props
  List<Object?> get props => [radioValue, order];
}

class SetOrdersSession extends StudentOrdersListEvent {
  final List<Order> orderList;

  const SetOrdersSession({required this.orderList});

  @override
  // TODO: implement props
  List<Object?> get props => [orderList];
}
