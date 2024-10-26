abstract class RolesState {}

class RolesInitial extends RolesState {}

class RolesLoading extends RolesState {}

class RolesSuccess extends RolesState {
  final String message;

  RolesSuccess({required this.message});
}

class RolesFailure extends RolesState {
  final String error;

  RolesFailure({required this.error});
}
