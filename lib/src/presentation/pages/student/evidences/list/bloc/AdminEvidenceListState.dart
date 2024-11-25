import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class AdminEvidenceListState extends Equatable {
  final Resource? response;

  const AdminEvidenceListState({this.response});

  AdminEvidenceListState copyWith({Resource? response}) {
    return AdminEvidenceListState(
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [response];
}
