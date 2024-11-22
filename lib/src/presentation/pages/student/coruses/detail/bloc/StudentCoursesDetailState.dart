import 'package:equatable/equatable.dart';

class StudentCoursesDetailState extends Equatable {

  final int quantity;

  StudentCoursesDetailState({
    this.quantity = 0
  });

  StudentCoursesDetailState copyWith({
    int? quantity
  }) {
    return StudentCoursesDetailState(quantity: quantity ?? this.quantity);
  }

  @override
  List<Object?> get props => [quantity];

}