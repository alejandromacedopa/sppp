
import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

abstract class AdminCategoryUpdateEvent extends Equatable {
  const AdminCategoryUpdateEvent();
  @override
  List<Object?> get props => [];
}

class AdminCategoryUpdateInitEvent extends AdminCategoryUpdateEvent {
  final Category? category;
  const AdminCategoryUpdateInitEvent({ required this.category });
  @override
  List<Object?> get props => [category];
}

class NameChanged extends AdminCategoryUpdateEvent {
  final BlocFormItem name;
  const NameChanged({ required this.name });
  @override
  List<Object?> get props => [name];
}

class DescriptionChanged extends AdminCategoryUpdateEvent {
  final BlocFormItem description;
  const DescriptionChanged({ required this.description });
  @override
  List<Object?> get props => [description];
}

class FormSubmit extends AdminCategoryUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class PickImage extends AdminCategoryUpdateEvent {
  const PickImage();
}

class TakePhoto extends AdminCategoryUpdateEvent {
  const TakePhoto();
}

class ResetForm extends AdminCategoryUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}