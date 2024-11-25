import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Order.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/orders/list/StudentOrdersListItem.dart';
import 'package:sppp/src/presentation/pages/student/orders/list/bloc/StudentOrdersListBloc.dart';
import 'package:sppp/src/presentation/pages/student/orders/list/bloc/StudentOrdersListEvent.dart';
import 'package:sppp/src/presentation/pages/student/orders/list/bloc/StudentOrdersListState.dart';

class StudentOrdersListPage extends StatefulWidget {
  const StudentOrdersListPage({super.key});

  @override
  State<StudentOrdersListPage> createState() => _StudentOrdersListPageState();
}

class _StudentOrdersListPageState extends State<StudentOrdersListPage> {
  late final StudentOrdersListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<StudentOrdersListBloc>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(GetUserOrders());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocListener<StudentOrdersListBloc, StudentOrdersListState>(
        listener: _blocListener,
        child: BlocBuilder<StudentOrdersListBloc, StudentOrdersListState>(
          builder: (context, state) => _buildBody(state),
        ),
      ),
    );
  }

  // AppBar mejorado
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Mis Compras',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 3.0,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  // BlocListener para manejar estados
  void _blocListener(BuildContext context, StudentOrdersListState state) {
    final response = state.response;
    if (response is Success && response.data is bool) {
      _bloc.add(GetUserOrders());
    } else if (response is Error) {
      Fluttertoast.showToast(
        msg: response.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  // Construcción del cuerpo basado en el estado
  Widget _buildBody(StudentOrdersListState state) {
    final response = state.response;

    if (response is Loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (response is Success) {
      final orders = response.data as List<Order>;

      if (orders.isEmpty) {
        return _buildEmptyState();
      }

      _bloc.add(SetOrdersSession(orderList: orders));
      return ListView.builder(
        itemCount: orders.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          return StudentOrdersListItem(_bloc, state, orders[index], index);
        },
      );
    }

    return _buildErrorState();
  }

  // Estado vacío
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.shopping_cart_outlined,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'No se encontraron órdenes',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // Estado de error
  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.redAccent,
          ),
          SizedBox(height: 16),
          Text(
            'Ocurrió un error al cargar las órdenes',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
