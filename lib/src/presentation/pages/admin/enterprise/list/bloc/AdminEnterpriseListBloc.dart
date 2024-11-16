import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/enterprise/EnterpriseUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListState.dart';

class AdminEnterpriseListBloc
    extends Bloc<AdminEnterpriseListEvent, AdminEnterpriseListState> {
  EnterpriseUseCases enterpriseUseCases;

  AdminEnterpriseListBloc(this.enterpriseUseCases) : super(AdminEnterpriseListState()) {
    on<GetEnterprise>(_onGetEnterprise);
    on<DeleteEnterprise>(_onDeleteEnterprise);
  }
  Future<void> _onGetEnterprise(
      GetEnterprise event, Emitter<AdminEnterpriseListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await enterpriseUseCases.getEnterprise.run();
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteEnterprise(
      DeleteEnterprise event, Emitter<AdminEnterpriseListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await enterpriseUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
