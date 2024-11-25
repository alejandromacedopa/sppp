import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class StudentOrdersListState extends Equatable {
  final int? radioValue;
  final Resource? response;

  const StudentOrdersListState({this.response, this.radioValue});

  StudentOrdersListState copyWith({Resource? response, int? radioValue}) {
    return StudentOrdersListState(
        response: response ?? this.response,
        radioValue: radioValue ?? this.radioValue);
  }

  @override
  List<Object?> get props => [response, radioValue];
}
