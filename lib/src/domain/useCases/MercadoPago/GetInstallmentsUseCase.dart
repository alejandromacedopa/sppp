
import 'package:sppp/src/domain/repository/MercadoPagoRepository.dart';

class GetInstallmentsUseCase {
  MercadoPagoRepository mercadoPagoRepository;

  GetInstallmentsUseCase(this.mercadoPagoRepository);

  run(String firstSixDigits, String amount) =>
      mercadoPagoRepository.getInstallments(firstSixDigits, amount);
}
