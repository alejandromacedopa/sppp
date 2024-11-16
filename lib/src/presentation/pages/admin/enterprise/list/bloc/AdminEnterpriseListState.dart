import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class AdminEnterpriseListState extends Equatable {
  final Resource? response;

  const AdminEnterpriseListState({this.response});

  AdminEnterpriseListState copyWith({Resource? response}) {
    return AdminEnterpriseListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
