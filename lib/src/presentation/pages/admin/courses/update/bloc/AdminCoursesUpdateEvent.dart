import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

abstract class AdminCoursesUpdateEvent extends Equatable {
  const AdminCoursesUpdateEvent();
  @override
  List<Object?> get props => [];
}

class AdminCoursesUpdateInitEvent extends AdminCoursesUpdateEvent {
  final Courses? courses;
  const AdminCoursesUpdateInitEvent({required this.courses});
  @override
  List<Object?> get props => [courses];
}

class NameChanged extends AdminCoursesUpdateEvent {
  final BlocFormItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class DescriptionChanged extends AdminCoursesUpdateEvent {
  final BlocFormItem description;
  const DescriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class PriceChanged extends AdminCoursesUpdateEvent {
  final BlocFormItem price;
  const PriceChanged({required this.price});
  @override
  List<Object?> get props => [price];
}

class FormSubmit extends AdminCoursesUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminCoursesUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

class PickImage extends AdminCoursesUpdateEvent {
  final int numberFile;
  const PickImage({required this.numberFile});
}

class TakePhoto extends AdminCoursesUpdateEvent {
  final int numberFile;
  const TakePhoto({required this.numberFile});
}