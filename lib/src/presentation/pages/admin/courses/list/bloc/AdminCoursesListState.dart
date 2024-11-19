import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class AdminCoursesListState extends Equatable {
  final Resource? response;

  const AdminCoursesListState({this.response});

  AdminCoursesListState copyWith({Resource? response}) {
    return AdminCoursesListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
