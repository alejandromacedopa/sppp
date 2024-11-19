import 'package:equatable/equatable.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

abstract class AdminCategoryCreateEvent extends Equatable {
  const AdminCategoryCreateEvent();
  @override
  List<Object?> get props => [];
}

class AdminCategoryCreateInitEvent extends AdminCategoryCreateEvent {
  const AdminCategoryCreateInitEvent();
  @override
  List<Object?> get props => [];
}

class NameChanged extends AdminCategoryCreateEvent {
  final BlocFormItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class DescriptionChanged extends AdminCategoryCreateEvent {
  final BlocFormItem description;
  const DescriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class FormSubmit extends AdminCategoryCreateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminCategoryCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}
//abrir galery
class PickImage extends AdminCategoryCreateEvent {
  const PickImage();
}
//abrir la camara
class TakePhoto extends AdminCategoryCreateEvent {
  const TakePhoto();
}