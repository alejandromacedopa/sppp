import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class AdminUserListState extends Equatable {
  final Resource? response;

  const AdminUserListState({this.response});

  AdminUserListState copyWith({Resource? response}) {
    return AdminUserListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
