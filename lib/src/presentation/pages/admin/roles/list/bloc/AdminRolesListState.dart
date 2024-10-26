import 'package:equatable/equatable.dart';

import 'package:sppp/src/domain/utils/Resource.dart';

class AdminRolesListState extends Equatable {
  final Resource? response;

  const AdminRolesListState({this.response});

  AdminRolesListState copyWith({Resource? response}) {
    return AdminRolesListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
