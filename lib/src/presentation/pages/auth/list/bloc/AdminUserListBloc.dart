import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/auth/list/bloc/AdminUserListEvent.dart';
import 'package:sppp/src/presentation/pages/auth/list/bloc/AdminUserListState.dart';

class AdminUserListBloc extends Bloc<AdminUserListEvent, AdminUserListState> {
  AuthUseCases userUseCases;

  AdminUserListBloc(this.userUseCases) : super(AdminUserListState()) {
    on<GetUser>(_onGetUser);
  }

  Future<void> _onGetUser(
      GetUser event, Emitter<AdminUserListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await userUseCases.getUser.run();
    emit(state.copyWith(response: response));
  }
}
