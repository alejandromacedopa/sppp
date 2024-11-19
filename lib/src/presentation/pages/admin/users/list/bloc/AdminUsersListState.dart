import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class AdminUsersListState extends Equatable {
  final Resource? response;

  const AdminUsersListState({this.response});

  AdminUsersListState copyWith({Resource? response}) {
    return AdminUsersListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
