import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';


abstract class AdminCoursesCreateEvent extends Equatable {
  const AdminCoursesCreateEvent();
  @override
  List<Object?> get props => [];
}

class AdminCoursesCreateInitEvent extends AdminCoursesCreateEvent {
  final Category? category;
  const AdminCoursesCreateInitEvent({required this.category});
  @override
  List<Object?> get props => [category];
}

class NameChanged extends AdminCoursesCreateEvent {
  final BlocFormItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class DescriptionChanged extends AdminCoursesCreateEvent {
  final BlocFormItem description;
  const DescriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class PriceChanged extends AdminCoursesCreateEvent {
  final BlocFormItem price;
  const PriceChanged({required this.price});
  @override
  List<Object?> get props => [price];
}

class FormSubmit extends AdminCoursesCreateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminCoursesCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

class PickImage extends AdminCoursesCreateEvent {
  final int numberFile;
  const PickImage({required this.numberFile});
}

class TakePhoto extends AdminCoursesCreateEvent {
  final int numberFile;
  const TakePhoto({required this.numberFile});
}
