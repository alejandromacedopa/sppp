import 'package:equatable/equatable.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

abstract class AdminEnterpriseCreateEvent extends Equatable {
  const AdminEnterpriseCreateEvent();
  @override
  List<Object?> get props => [];
}

class AdminEnterpriseCreateInitEvent extends AdminEnterpriseCreateEvent {
  const AdminEnterpriseCreateInitEvent();
  @override
  List<Object?> get props => [];
}

class NameChanged extends AdminEnterpriseCreateEvent {
  final BlocFormItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class SupervisorChanged extends AdminEnterpriseCreateEvent {
  final BlocFormItem supervisor;
  const SupervisorChanged({required this.supervisor});
  @override
  List<Object?> get props => [supervisor];
}

class FormSubmit extends AdminEnterpriseCreateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminEnterpriseCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

class PickImage extends AdminEnterpriseCreateEvent {
  const PickImage();
}

class TakePhoto extends AdminEnterpriseCreateEvent {
  const TakePhoto();
}