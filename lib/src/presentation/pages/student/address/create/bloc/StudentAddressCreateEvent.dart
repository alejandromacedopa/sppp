import 'package:equatable/equatable.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

abstract class StudentAddressCreateEvent extends Equatable {
  const StudentAddressCreateEvent();
  @override
  List<Object?> get props => [];
}

class StudentAddressCreateInitEvent extends StudentAddressCreateEvent {
  const StudentAddressCreateInitEvent();
}

class AddressChanged extends StudentAddressCreateEvent {
  final BlocFormItem address;
  const AddressChanged({required this.address});
  @override
  List<Object?> get props => [address];
}

class NeighborhoodChanged extends StudentAddressCreateEvent {
  final BlocFormItem neighborhood;
  const NeighborhoodChanged({required this.neighborhood});
  @override
  List<Object?> get props => [neighborhood];
}

class FormSubmit extends StudentAddressCreateEvent {
  const FormSubmit();
}
