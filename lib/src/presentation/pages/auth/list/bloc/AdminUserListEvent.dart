import 'package:equatable/equatable.dart';

abstract class AdminUserListEvent extends Equatable {
  const AdminUserListEvent();
  @override
  List<Object?> get props => [];
}

class GetUser extends AdminUserListEvent {
  const GetUser();
}

/*class DeleteRoles extends AdminUserListEvent {
  final int id;
  const DeleteRoles({required this.id});
  @override
  List<Object?> get props => [id];
}*/
