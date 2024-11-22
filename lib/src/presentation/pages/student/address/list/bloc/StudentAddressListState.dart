import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class StudentAddressListState extends Equatable {
  final int? radioValue;
  final Resource? response;

  const StudentAddressListState({this.response, this.radioValue});

  StudentAddressListState copyWith({Resource? response, int? radioValue}) {
    return StudentAddressListState(
        response: response ?? this.response,
        radioValue: radioValue ?? this.radioValue);
  }

  @override
  List<Object?> get props => [response, radioValue];
}
