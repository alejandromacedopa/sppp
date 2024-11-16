import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/Roles.dart';

class RolesState extends Equatable {
  final List<Roles?>? roles;

  const RolesState({this.roles});

  RolesState copyWith({List<Roles?>? roles}) {
    return RolesState(roles: roles);
  }

  @override
  List<Object?> get props => [roles];
}
