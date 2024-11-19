import 'package:equatable/equatable.dart';

abstract class AdminCoursesListEvent extends Equatable {
  const AdminCoursesListEvent();
  @override
  List<Object?> get props => [];
}

class GetCoursesByCategory extends AdminCoursesListEvent {
  final int idCategory;

  const GetCoursesByCategory({required this.idCategory});

  @override
  List<Object?> get props => [idCategory];
}

class DeleteCourses extends AdminCoursesListEvent {
  final int id;
  const DeleteCourses({required this.id});

  @override
  List<Object?> get props => [id];
}
