import 'package:equatable/equatable.dart';

abstract class StudentCoursesListEvent extends Equatable {
  const StudentCoursesListEvent();
  @override
  List<Object?> get props => [];
}

class GetCoursesByCategory extends StudentCoursesListEvent {
  final int idCategory;

  const GetCoursesByCategory({required this.idCategory});

  @override
  List<Object?> get props => [idCategory];
}

class DeleteCourses extends StudentCoursesListEvent {
  final int id;
  const DeleteCourses({required this.id});

  @override
  List<Object?> get props => [id];
}
