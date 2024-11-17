import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent, AdminHomeState> {

  AuthUseCases authUseCases;


  AdminHomeBloc(this.authUseCases):super(AdminHomeState()){
    on<AdminLogout> (_onAdminLogout);
    on<AdminChangeDrawerPage> (_onAdminChangeDrawerPage);
  }

  Future<void> _onAdminLogout(AdminLogout event, Emitter <AdminHomeState> emit) async {
    await authUseCases.logout.run();
  }

  Future<void> _onAdminChangeDrawerPage(AdminChangeDrawerPage event, Emitter <AdminHomeState> emit) async {
    emit(
        state.copyWith(
            pageIndex: event.pageIndex
        )
    );
  }




}