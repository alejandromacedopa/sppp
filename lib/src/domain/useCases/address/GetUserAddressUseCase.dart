import 'package:sppp/src/domain/repository/AddressRepository.dart';

class GetUserAddressUseCase {
  AddressRepository addressRepository;

  GetUserAddressUseCase(this.addressRepository);

  run(String idUser) => addressRepository.getUserAddress(idUser);
}
