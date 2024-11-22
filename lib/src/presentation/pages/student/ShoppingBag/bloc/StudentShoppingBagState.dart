import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/Courses.dart';

class StudentShoppingBagState extends Equatable {
  final List<Courses> courses;
  final double total;

  StudentShoppingBagState({this.courses = const [], this.total = 0});

  StudentShoppingBagState copyWith({List<Courses>? courses, double? total}) {
    return StudentShoppingBagState(
        courses: courses ?? this.courses, total: total ?? this.total);
  }

  @override
  List<Object?> get props => [courses, total];
}
