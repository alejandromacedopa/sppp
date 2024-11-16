import 'package:equatable/equatable.dart';

abstract class AdminEnterpriseListEvent extends Equatable {
  const AdminEnterpriseListEvent();
  @override
  List<Object?> get props => [];
}

class GetEnterprise extends AdminEnterpriseListEvent {
  const GetEnterprise();
}

class DeleteEnterprise extends AdminEnterpriseListEvent {
  final int id;
  const DeleteEnterprise({required this.id});

  @override
  List<Object?> get props => [id];
}
