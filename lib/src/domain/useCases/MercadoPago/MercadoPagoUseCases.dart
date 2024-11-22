
import 'package:sppp/src/domain/useCases/MercadoPago/CreateCardTokenUseCase.dart';
import 'package:sppp/src/domain/useCases/MercadoPago/CreatePaymentUseCase.dart';
import 'package:sppp/src/domain/useCases/MercadoPago/GetIdentificationTypesUseCase.dart';
import 'package:sppp/src/domain/useCases/MercadoPago/GetInstallmentsUseCase.dart';

class MercadoPagoUseCases {
  GetIdentificationTypesUseCase getIdentificationTypes;
  CreateCardTokenUseCase createCardToken;
  GetInstallmentsUseCase getInstallments;
  CreatePaymentUseCase createPaymentUseCase;

  MercadoPagoUseCases({
    required this.getIdentificationTypes,
    required this.createCardToken,
    required this.getInstallments,
    required this.createPaymentUseCase,
  });
}
