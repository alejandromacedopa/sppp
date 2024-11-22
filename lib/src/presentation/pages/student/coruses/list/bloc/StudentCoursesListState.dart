import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class StudentCoursesListState extends Equatable {
  final Resource? response;

  const StudentCoursesListState({this.response});

  StudentCoursesListState copyWith({Resource? response}) {
    return StudentCoursesListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
