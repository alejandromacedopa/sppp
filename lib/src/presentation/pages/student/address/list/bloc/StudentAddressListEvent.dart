import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/models/Address.dart';

abstract class StudentAddressListEvent extends Equatable {
  const StudentAddressListEvent();
  @override
  List<Object?> get props => [];
}

class GetUserAddress extends StudentAddressListEvent {
  const GetUserAddress();
}

class ChangeRadioValue extends StudentAddressListEvent {
  final int radioValue;
  final Address address;

  ChangeRadioValue({required this.radioValue, required this.address});

  @override
  // TODO: implement props
  List<Object?> get props => [radioValue, address];
}

class SetAddressSession extends StudentAddressListEvent {
  final List<Address> addressList;

  const SetAddressSession({required this.addressList});

  @override
  // TODO: implement props
  List<Object?> get props => [addressList];
}

class DeleteAddress extends StudentAddressListEvent {
  final int id;
  const DeleteAddress({required this.id});
  @override
  List<Object?> get props => [id];
}
