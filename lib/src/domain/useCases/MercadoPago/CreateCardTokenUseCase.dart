

import 'package:sppp/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:sppp/src/domain/repository/MercadoPagoRepository.dart';

class CreateCardTokenUseCase {
  MercadoPagoRepository mercadoPagoRepository;

  CreateCardTokenUseCase(this.mercadoPagoRepository);

  run(MercadoPagoCardTokenBody mercadoPagoCardTokenBody) =>
      mercadoPagoRepository.createCardToken(mercadoPagoCardTokenBody);
}
