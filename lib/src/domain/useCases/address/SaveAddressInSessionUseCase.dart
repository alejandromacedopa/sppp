import 'package:sppp/src/domain/models/Address.dart';
import 'package:sppp/src/domain/repository/AddressRepository.dart';

class SaveAddressInSessionUseCase {
  AddressRepository addressRepository;

  SaveAddressInSessionUseCase(this.addressRepository);

  run(Address address) => addressRepository.saveAddressInSession(address);
}
