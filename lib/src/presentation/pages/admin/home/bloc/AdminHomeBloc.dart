import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent, AdminHomeState> {
  AdminHomeBloc() : super(AdminHomeState()) {
    on<AdminChangeDrawerPage>(_onAdminChangeDrawerPage);
    on<AdminLogout>(_onAdminLogout);
  }

  Future<void> _onAdminLogout(
      AdminLogout event, Emitter<AdminHomeState> emit) async {}

  Future<void> _onAdminChangeDrawerPage(
      AdminChangeDrawerPage event, Emitter<AdminHomeState> emit) async {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }
}
