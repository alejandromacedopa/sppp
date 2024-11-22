

import 'package:sppp/src/data/dataSource/remote/services/MercadoPagoService.dart';
import 'package:sppp/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:sppp/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:sppp/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:sppp/src/domain/models/MercadoPagoInstallments.dart';
import 'package:sppp/src/domain/models/MercadoPagoPaymentBody.dart';
import 'package:sppp/src/domain/models/MercadoPagoPaymentResponse2.dart';
import 'package:sppp/src/domain/repository/MercadoPagoRepository.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class MercadoPagoRepositoryImpl implements MercadoPagoRepository {
  MercadoPagoService mercadoPagoService;

  MercadoPagoRepositoryImpl(this.mercadoPagoService);

  @override
  Future<Resource<List<MercadoPagoIdentificationType>>>
      getIdentificationTypes() {
    return mercadoPagoService.getIdentificationTypes();
  }

  @override
  Future<Resource<MercadoPagoCardTokenResponse>> createCardToken(
      MercadoPagoCardTokenBody mercadoPagoCardTokenBody) {
    return mercadoPagoService.createCardToken(mercadoPagoCardTokenBody);
  }

  @override
  Future<Resource<MercadoPagoInstallments>> getInstallments(
      String firstSixDigits, String amount) {
    return mercadoPagoService.getInstallments(firstSixDigits, amount);
  }

  @override
  Future<Resource<MercadoPagoPaymentResponse2>> createPayment(
      MercadoPagoPaymentBody mercadoPagoPaymentBody) {
    return mercadoPagoService.createPayment(mercadoPagoPaymentBody);
  }
}
