import 'package:sppp/src/domain/repository/AddressRepository.dart';

class DeleteAddressFromSessionUseCase {
  AddressRepository addressRepository;

  DeleteAddressFromSessionUseCase(this.addressRepository);

  run() => addressRepository.deleteFromSession();
}
