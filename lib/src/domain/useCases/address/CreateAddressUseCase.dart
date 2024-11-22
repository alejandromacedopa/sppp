

import 'package:sppp/src/domain/models/Address.dart';
import 'package:sppp/src/domain/repository/AddressRepository.dart';

class CreateAddressUseCase {
  AddressRepository addressRepository;

  CreateAddressUseCase(this.addressRepository);

  run(Address address) => addressRepository.create(address);
}
