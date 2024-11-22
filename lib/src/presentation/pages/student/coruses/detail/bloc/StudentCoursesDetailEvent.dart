import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/Courses.dart';

abstract class StudentCoursesDetailEvent extends Equatable {
  const StudentCoursesDetailEvent();
  @override
  List<Object?> get props => [];
}

class ResetState extends StudentCoursesDetailEvent {
  const ResetState();
}

class GetCourses extends StudentCoursesDetailEvent {
  final Courses courses;
  const GetCourses({required this.courses});
  @override
  List<Object?> get props => [courses];
}

class AddItem extends StudentCoursesDetailEvent {
  const AddItem();
  @override
  List<Object?> get props => [];
}

class SubtractItem extends StudentCoursesDetailEvent {
  const SubtractItem();
  @override
  List<Object?> get props => [];
}

class AddCoursesToShoppingBag extends StudentCoursesDetailEvent {
  final Courses courses;
  const AddCoursesToShoppingBag({required this.courses});
  @override
  List<Object?> get props => [courses];
}
