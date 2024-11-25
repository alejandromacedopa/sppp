import 'package:equatable/equatable.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

abstract class AdminEvidenceCreateEvent extends Equatable {
  const AdminEvidenceCreateEvent();
  @override
  List<Object?> get props => [];
}

class AdminEvidenceCreateInitEvent extends AdminEvidenceCreateEvent {}

class NameChanged extends AdminEvidenceCreateEvent {
  final BlocFormItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class DescriptionChanged extends AdminEvidenceCreateEvent {
  final BlocFormItem description;
  const DescriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class EvidenceLinkChanged extends AdminEvidenceCreateEvent {
  final BlocFormItem evidenceLink;
  const EvidenceLinkChanged({required this.evidenceLink});
  @override
  List<Object?> get props => [evidenceLink];
}

class FormSubmit extends AdminEvidenceCreateEvent {
  const FormSubmit();
}

class ResetForm extends AdminEvidenceCreateEvent {
  const ResetForm();
}
