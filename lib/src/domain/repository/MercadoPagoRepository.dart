
import 'package:sppp/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:sppp/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:sppp/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:sppp/src/domain/models/MercadoPagoInstallments.dart';
import 'package:sppp/src/domain/models/MercadoPagoPaymentBody.dart';
import 'package:sppp/src/domain/models/MercadoPagoPaymentResponse2.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

abstract class MercadoPagoRepository {
  Future<Resource<List<MercadoPagoIdentificationType>>>
      getIdentificationTypes();
  Future<Resource<MercadoPagoCardTokenResponse>> createCardToken(
      MercadoPagoCardTokenBody mercadoPagoCardTokenBody);
  Future<Resource<MercadoPagoInstallments>> getInstallments(
      String firstSixDigits, String amount);
  Future<Resource<MercadoPagoPaymentResponse2>> createPayment(
      MercadoPagoPaymentBody mercadoPagoPaymentBody);
}
