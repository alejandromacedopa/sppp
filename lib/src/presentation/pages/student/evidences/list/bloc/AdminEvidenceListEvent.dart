import 'package:equatable/equatable.dart';

abstract class AdminEvidenceListEvent extends Equatable {
  const AdminEvidenceListEvent();
  @override
  List<Object?> get props => [];
}

class GetEvidences extends AdminEvidenceListEvent {
  const GetEvidences();

  @override
  List<Object?> get props => [];
}

class DeleteEvidence extends AdminEvidenceListEvent {
  final int id;
  const DeleteEvidence({required this.id});

  @override
  List<Object?> get props => [id];
}
