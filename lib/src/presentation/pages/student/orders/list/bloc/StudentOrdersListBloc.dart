import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/domain/models/Order.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/domain/useCases/orders/OrdersUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/orders/list/bloc/StudentOrdersListEvent.dart';
import 'package:sppp/src/presentation/pages/student/orders/list/bloc/StudentOrdersListState.dart';

class StudentOrdersListBloc
    extends Bloc<StudentOrdersListEvent, StudentOrdersListState> {
  OrdersUseCases ordersUseCases;
  AuthUseCases authUseCases;

  StudentOrdersListBloc(this.ordersUseCases, this.authUseCases)
      : super(StudentOrdersListState()) {
    on<GetUserOrders>(_onGetUserAddress);
    on<ChangeRadioValue>(_onChangeRadioValue);
    on<SetOrdersSession>(_onSetAddressSession);
  }

  Future<void> _onGetUserAddress(
      GetUserOrders event, Emitter<StudentOrdersListState> emit) async {
    AuthResponse? authResponse = await authUseCases.getUserSession.run();
    if (authResponse != null) {
      emit(state.copyWith(response: Loading()));
      Resource response =
      await ordersUseCases.getUserOrders.run(authResponse.user.id!);
      emit(state.copyWith(response: response));
    }
  }

  Future<void> _onChangeRadioValue(
      ChangeRadioValue event, Emitter<StudentOrdersListState> emit) async {
    emit(state.copyWith(radioValue: event.radioValue));
    await ordersUseCases.saveOrdersInSession.run(event.order);
  }

  Future<void> _onSetAddressSession(
      SetOrdersSession event, Emitter<StudentOrdersListState> emit) async {
    Order? orderSession = await ordersUseCases.getOrdersSession.run();
    print('order session:${orderSession?.toJson()}');
    if (orderSession != null) {
      int index = event.orderList
          .indexWhere((order) => order.idClient == orderSession.idClient);
      if (index != -1) {
        // YA HEMOS SELECCIONADO UNA DIRECCION Y ESTA GUARDADA EN SESION
        emit(state.copyWith(radioValue: index));
      }
    }
  }

}
