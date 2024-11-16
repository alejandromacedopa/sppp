import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

abstract class AdminEnterpriseUpdateEvent extends Equatable {
  const AdminEnterpriseUpdateEvent();
  @override
  List<Object?> get props => [];
}

class AdminEnterpriseUpdateInitEvent extends AdminEnterpriseUpdateEvent {
  final Enterprise? enterprise;
  const AdminEnterpriseUpdateInitEvent({ required this.enterprise });
  @override
  List<Object?> get props => [enterprise];
}

class NameChanged extends AdminEnterpriseUpdateEvent {
  final BlocFormItem name;
  const NameChanged({ required this.name });
  @override
  List<Object?> get props => [name];
}

class SupervisorChanged extends AdminEnterpriseUpdateEvent {
  final BlocFormItem supervisor;
  const SupervisorChanged({ required this.supervisor });
  @override
  List<Object?> get props => [supervisor];
}

class FormSubmit extends AdminEnterpriseUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class PickImage extends AdminEnterpriseUpdateEvent {
  const PickImage();
}

class TakePhoto extends AdminEnterpriseUpdateEvent {
  const TakePhoto();
}

class ResetForm extends AdminEnterpriseUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}