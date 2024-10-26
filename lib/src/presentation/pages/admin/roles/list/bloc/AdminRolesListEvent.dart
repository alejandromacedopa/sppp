import 'package:equatable/equatable.dart';

abstract class AdminRolesListEvent extends Equatable {
  const AdminRolesListEvent();
  @override
  List<Object?> get props => [];
}

class GetRoles extends AdminRolesListEvent {
  const GetRoles();
}

/*class DeleteRoles extends AdminRolesListEvent {
  final int id;
  const DeleteRoles({required this.id});
  @override
  List<Object?> get props => [id];
}*/
