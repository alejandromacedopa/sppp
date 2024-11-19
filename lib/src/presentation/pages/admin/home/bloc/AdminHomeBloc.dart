import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent, AdminHomeState> {
  AuthUseCases authUseCases;

  AdminHomeBloc(this.authUseCases) : super(const AdminHomeState()) {
    on<AdminLogout>(_onAdminLogout);
    on<AdminChangeDrawerPage>(_onAdminChangeDrawerPage);
  }

  Future<void> _onAdminLogout(
      AdminLogout event, Emitter<AdminHomeState> emit) async {
    await authUseCases.logout.run();
  }

  Future<void> _onAdminChangeDrawerPage(
      AdminChangeDrawerPage event, Emitter<AdminHomeState> emit) async {
    // Mostrar loading antes de cambiar la página
    emit(state.copyWith(isLoading: true));

    // Simular un pequeño retraso para mostrar el spinner
    await Future.delayed(const Duration(milliseconds: 1500));

    // Cambiar la página y ocultar el loading
    emit(state.copyWith(pageIndex: event.pageIndex, isLoading: false));
  }
}
