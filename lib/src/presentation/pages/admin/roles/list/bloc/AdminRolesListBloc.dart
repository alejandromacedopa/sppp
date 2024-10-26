import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/roles/RolesUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/bloc/AdminRolesListEvent.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/bloc/AdminRolesListState.dart';

class AdminRolesListBloc
    extends Bloc<AdminRolesListEvent, AdminRolesListState> {
  RolesUseCases rolesUseCases;

  AdminRolesListBloc(this.rolesUseCases) : super(AdminRolesListState()) {
    on<GetRoles>(_onGetRoles);
  }

  Future<void> _onGetRoles(
      GetRoles event, Emitter<AdminRolesListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await rolesUseCases.getRoles.run();
    emit(state.copyWith(response: response));
  }
}
