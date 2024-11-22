import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/Courses.dart';

abstract class StudentShoppingBagEvent extends Equatable {
  const StudentShoppingBagEvent();
  @override
  List<Object?> get props => [];
}

class GetShoppingBag extends StudentShoppingBagEvent {
  const GetShoppingBag();
}

class AddItem extends StudentShoppingBagEvent {
  final Courses courses;
  const AddItem({required this.courses});
  @override
  // TODO: implement props
  List<Object?> get props => [courses];
}

class SubtractItem extends StudentShoppingBagEvent {
  final Courses courses;
  const SubtractItem({required this.courses});
  @override
  // TODO: implement props
  List<Object?> get props => [courses];
}

class RemoveItem extends StudentShoppingBagEvent {
  final Courses courses;
  const RemoveItem({required this.courses});
  @override
  // TODO: implement props
  List<Object?> get props => [courses];
}

class GetTotal extends StudentShoppingBagEvent {
  const GetTotal();
}
