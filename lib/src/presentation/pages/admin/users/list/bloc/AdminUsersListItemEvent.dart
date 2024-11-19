import 'package:equatable/equatable.dart';

abstract class AdminUsersListEvent extends Equatable {
  const AdminUsersListEvent();
  @override
  List<Object?> get props => [];
}

class GetUsers extends AdminUsersListEvent {
  const GetUsers();
}

class DeleteUsers extends AdminUsersListEvent {
  final int id;
  const DeleteUsers({required this.id});

  @override
  List<Object?> get props => [id];
}
