import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/users/UsersUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/users/list/bloc/AdminUsersListItemEvent.dart';
import 'package:sppp/src/presentation/pages/admin/users/list/bloc/AdminUsersListState.dart';

class AdminUsersListBloc
    extends Bloc<AdminUsersListEvent, AdminUsersListState> {
  UsersUseCases usersUseCases;

  AdminUsersListBloc(this.usersUseCases) : super(AdminUsersListState()) {
    on<GetUsers>(_onGetUsers);
    on<DeleteUsers>(_onDDeleteUsers);
  }
  Future<void> _onGetUsers(
      GetUsers event, Emitter<AdminUsersListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await usersUseCases.getUsers.run();
    emit(state.copyWith(response: response));
  }

  Future<void> _onDDeleteUsers(
      DeleteUsers event, Emitter<AdminUsersListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await usersUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
