import 'dart:convert';
import 'package:sppp/src/domain/models/MercadoPagoCardTokenBody.dart';

MercadoPagoPaymentResponse mercadoPagoPaymentResponseFromJson(String str) =>
    MercadoPagoPaymentResponse.fromJson(json.decode(str));

String mercadoPagoPaymentResponseToJson(MercadoPagoPaymentResponse data) =>
    json.encode(data.toJson());

class MercadoPagoPaymentResponse {
  int id;
  DateTime dateCreated;
  DateTime dateApproved;
  DateTime dateLastUpdated;
  dynamic dateOfExpiration;
  DateTime moneyReleaseDate;
  String moneyReleaseStatus;
  String operationType;
  String issuerId;
  String paymentMethodId;
  String paymentTypeId;
  PaymentMethod paymentMethod;
  String status;
  String statusDetail;
  String currencyId;
  dynamic description;
  bool liveMode;
  dynamic sponsorId;
  String authorizationCode;
  dynamic moneyReleaseSchema;
  int taxesAmount;
  dynamic counterCurrency;
  dynamic brandId;
  int shippingAmount;
  String buildVersion;
  dynamic posId;
  dynamic storeId;
  dynamic integratorId;
  dynamic platformId;
  dynamic corporationId;
  Payer payer;
  int collectorId;
  dynamic marketplaceOwner;
  Metadata metadata;
  AdditionalInfo additionalInfo;
  Metadata order;
  dynamic externalReference;
  int transactionAmount;
  int netAmount;
  List<Tax> taxes;
  int transactionAmountRefunded;
  int couponAmount;
  dynamic differentialPricingId;
  dynamic financingGroup;
  dynamic deductionSchema;
  int installments;
  TransactionDetails transactionDetails;
  List<FeeDetail> feeDetails;
  List<ChargesDetail> chargesDetails;
  bool captured;
  bool binaryMode;
  dynamic callForAuthorizeId;
  dynamic statementDescriptor;
  Card card;
  dynamic notificationUrl;
  List<dynamic> refunds;
  String processingMode;
  dynamic merchantAccountId;
  dynamic merchantNumber;
  List<dynamic> acquirerReconciliation;
  PointOfInteraction pointOfInteraction;
  dynamic accountsInfo;
  dynamic tags;

  MercadoPagoPaymentResponse({
    required this.id,
    required this.dateCreated,
    required this.dateApproved,
    required this.dateLastUpdated,
    required this.dateOfExpiration,
    required this.moneyReleaseDate,
    required this.moneyReleaseStatus,
    required this.operationType,
    required this.issuerId,
    required this.paymentMethodId,
    required this.paymentTypeId,
    required this.paymentMethod,
    required this.status,
    required this.statusDetail,
    required this.currencyId,
    required this.description,
    required this.liveMode,
    required this.sponsorId,
    required this.authorizationCode,
    required this.moneyReleaseSchema,
    required this.taxesAmount,
    required this.counterCurrency,
    required this.brandId,
    required this.shippingAmount,
    required this.buildVersion,
    required this.posId,
    required this.storeId,
    required this.integratorId,
    required this.platformId,
    required this.corporationId,
    required this.payer,
    required this.collectorId,
    required this.marketplaceOwner,
    required this.metadata,
    required this.additionalInfo,
    required this.order,
    required this.externalReference,
    required this.transactionAmount,
    required this.netAmount,
    required this.taxes,
    required this.transactionAmountRefunded,
    required this.couponAmount,
    required this.differentialPricingId,
    required this.financingGroup,
    required this.deductionSchema,
    required this.installments,
    required this.transactionDetails,
    required this.feeDetails,
    required this.chargesDetails,
    required this.captured,
    required this.binaryMode,
    required this.callForAuthorizeId,
    required this.statementDescriptor,
    required this.card,
    required this.notificationUrl,
    required this.refunds,
    required this.processingMode,
    required this.merchantAccountId,
    required this.merchantNumber,
    required this.acquirerReconciliation,
    required this.pointOfInteraction,
    required this.accountsInfo,
    required this.tags,
  });

  factory MercadoPagoPaymentResponse.fromJson(Map<String, dynamic> json) =>
      MercadoPagoPaymentResponse(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateApproved: DateTime.parse(json["date_approved"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        dateOfExpiration: json["date_of_expiration"],
        moneyReleaseDate: DateTime.parse(json["money_release_date"]),
        moneyReleaseStatus: json["money_release_status"],
        operationType: json["operation_type"],
        issuerId: json["issuer_id"],
        paymentMethodId: json["payment_method_id"],
        paymentTypeId: json["payment_type_id"],
        paymentMethod: PaymentMethod.fromJson(json["payment_method"]),
        status: json["status"],
        statusDetail: json["status_detail"],
        currencyId: json["currency_id"],
        description: json["description"],
        liveMode: json["live_mode"],
        sponsorId: json["sponsor_id"],
        authorizationCode: json["authorization_code"],
        moneyReleaseSchema: json["money_release_schema"],
        taxesAmount: json["taxes_amount"],
        counterCurrency: json["counter_currency"],
        brandId: json["brand_id"],
        shippingAmount: json["shipping_amount"],
        buildVersion: json["build_version"],
        posId: json["pos_id"],
        storeId: json["store_id"],
        integratorId: json["integrator_id"],
        platformId: json["platform_id"],
        corporationId: json["corporation_id"],
        payer: Payer.fromJson(json["payer"]),
        collectorId: json["collector_id"],
        marketplaceOwner: json["marketplace_owner"],
        metadata: Metadata.fromJson(json["metadata"]),
        additionalInfo: AdditionalInfo.fromJson(json["additional_info"]),
        order: Metadata.fromJson(json["order"]),
        externalReference: json["external_reference"],
        transactionAmount: json["transaction_amount"],
        netAmount: json["net_amount"],
        taxes: List<Tax>.from(json["taxes"].map((x) => Tax.fromJson(x))),
        transactionAmountRefunded: json["transaction_amount_refunded"],
        couponAmount: json["coupon_amount"],
        differentialPricingId: json["differential_pricing_id"],
        financingGroup: json["financing_group"],
        deductionSchema: json["deduction_schema"],
        installments: json["installments"],
        transactionDetails:
            TransactionDetails.fromJson(json["transaction_details"]),
        feeDetails: List<FeeDetail>.from(
            json["fee_details"].map((x) => FeeDetail.fromJson(x))),
        chargesDetails: List<ChargesDetail>.from(
            json["charges_details"].map((x) => ChargesDetail.fromJson(x))),
        captured: json["captured"],
        binaryMode: json["binary_mode"],
        callForAuthorizeId: json["call_for_authorize_id"],
        statementDescriptor: json["statement_descriptor"],
        card: Card.fromJson(json["card"]),
        notificationUrl: json["notification_url"],
        refunds: List<dynamic>.from(json["refunds"].map((x) => x)),
        processingMode: json["processing_mode"],
        merchantAccountId: json["merchant_account_id"],
        merchantNumber: json["merchant_number"],
        acquirerReconciliation:
            List<dynamic>.from(json["acquirer_reconciliation"].map((x) => x)),
        pointOfInteraction:
            PointOfInteraction.fromJson(json["point_of_interaction"]),
        accountsInfo: json["accounts_info"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_approved": dateApproved.toIso8601String(),
        "date_last_updated": dateLastUpdated.toIso8601String(),
        "date_of_expiration": dateOfExpiration,
        "money_release_date": moneyReleaseDate.toIso8601String(),
        "money_release_status": moneyReleaseStatus,
        "operation_type": operationType,
        "issuer_id": issuerId,
        "payment_method_id": paymentMethodId,
        "payment_type_id": paymentTypeId,
        "payment_method": paymentMethod.toJson(),
        "status": status,
        "status_detail": statusDetail,
        "currency_id": currencyId,
        "description": description,
        "live_mode": liveMode,
        "sponsor_id": sponsorId,
        "authorization_code": authorizationCode,
        "money_release_schema": moneyReleaseSchema,
        "taxes_amount": taxesAmount,
        "counter_currency": counterCurrency,
        "brand_id": brandId,
        "shipping_amount": shippingAmount,
        "build_version": buildVersion,
        "pos_id": posId,
        "store_id": storeId,
        "integrator_id": integratorId,
        "platform_id": platformId,
        "corporation_id": corporationId,
        "payer": payer.toJson(),
        "collector_id": collectorId,
        "marketplace_owner": marketplaceOwner,
        "metadata": metadata.toJson(),
        "additional_info": additionalInfo.toJson(),
        "order": order.toJson(),
        "external_reference": externalReference,
        "transaction_amount": transactionAmount,
        "net_amount": netAmount,
        "taxes": List<dynamic>.from(taxes.map((x) => x.toJson())),
        "transaction_amount_refunded": transactionAmountRefunded,
        "coupon_amount": couponAmount,
        "differential_pricing_id": differentialPricingId,
        "financing_group": financingGroup,
        "deduction_schema": deductionSchema,
        "installments": installments,
        "transaction_details": transactionDetails.toJson(),
        "fee_details": List<dynamic>.from(feeDetails.map((x) => x.toJson())),
        "charges_details":
            List<dynamic>.from(chargesDetails.map((x) => x.toJson())),
        "captured": captured,
        "binary_mode": binaryMode,
        "call_for_authorize_id": callForAuthorizeId,
        "statement_descriptor": statementDescriptor,
        "card": card.toJson(),
        "notification_url": notificationUrl,
        "refunds": List<dynamic>.from(refunds.map((x) => x)),
        "processing_mode": processingMode,
        "merchant_account_id": merchantAccountId,
        "merchant_number": merchantNumber,
        "acquirer_reconciliation":
            List<dynamic>.from(acquirerReconciliation.map((x) => x)),
        "point_of_interaction": pointOfInteraction.toJson(),
        "accounts_info": accountsInfo,
        "tags": tags,
      };
}

class AdditionalInfo {
  dynamic availableBalance;
  dynamic nsuProcessadora;
  dynamic authenticationCode;

  AdditionalInfo({
    required this.availableBalance,
    required this.nsuProcessadora,
    required this.authenticationCode,
  });

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) => AdditionalInfo(
        availableBalance: json["available_balance"],
        nsuProcessadora: json["nsu_processadora"],
        authenticationCode: json["authentication_code"],
      );

  Map<String, dynamic> toJson() => {
        "available_balance": availableBalance,
        "nsu_processadora": nsuProcessadora,
        "authentication_code": authenticationCode,
      };
}

class Card {
  dynamic id;
  String firstSixDigits;
  String lastFourDigits;
  int expirationMonth;
  int expirationYear;
  DateTime dateCreated;
  DateTime dateLastUpdated;
  Cardholder cardholder;

  Card({
    required this.id,
    required this.firstSixDigits,
    required this.lastFourDigits,
    required this.expirationMonth,
    required this.expirationYear,
    required this.dateCreated,
    required this.dateLastUpdated,
    required this.cardholder,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        id: json["id"],
        firstSixDigits: json["first_six_digits"],
        lastFourDigits: json["last_four_digits"],
        expirationMonth: json["expiration_month"],
        expirationYear: json["expiration_year"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        cardholder: Cardholder.fromJson(json["cardholder"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_six_digits": firstSixDigits,
        "last_four_digits": lastFourDigits,
        "expiration_month": expirationMonth,
        "expiration_year": expirationYear,
        "date_created": dateCreated.toIso8601String(),
        "date_last_updated": dateLastUpdated.toIso8601String(),
        "cardholder": cardholder.toJson(),
      };
}

class ChargesDetail {
  String id;
  String name;
  String type;
  Accounts accounts;
  int clientId;
  DateTime dateCreated;
  DateTime lastUpdated;
  Amounts amounts;
  Metadata metadata;
  dynamic reserveId;
  List<dynamic> refundCharges;

  ChargesDetail({
    required this.id,
    required this.name,
    required this.type,
    required this.accounts,
    required this.clientId,
    required this.dateCreated,
    required this.lastUpdated,
    required this.amounts,
    required this.metadata,
    required this.reserveId,
    required this.refundCharges,
  });

  factory ChargesDetail.fromJson(Map<String, dynamic> json) => ChargesDetail(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        accounts: Accounts.fromJson(json["accounts"]),
        clientId: json["client_id"],
        dateCreated: DateTime.parse(json["date_created"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
        amounts: Amounts.fromJson(json["amounts"]),
        metadata: Metadata.fromJson(json["metadata"]),
        reserveId: json["reserve_id"],
        refundCharges: List<dynamic>.from(json["refund_charges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "accounts": accounts.toJson(),
        "client_id": clientId,
        "date_created": dateCreated.toIso8601String(),
        "last_updated": lastUpdated.toIso8601String(),
        "amounts": amounts.toJson(),
        "metadata": metadata.toJson(),
        "reserve_id": reserveId,
        "refund_charges": List<dynamic>.from(refundCharges.map((x) => x)),
      };
}

class Accounts {
  String from;
  String to;

  Accounts({
    required this.from,
    required this.to,
  });

  factory Accounts.fromJson(Map<String, dynamic> json) => Accounts(
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
      };
}

class Amounts {
  int original;
  int refunded;

  Amounts({
    required this.original,
    required this.refunded,
  });

  factory Amounts.fromJson(Map<String, dynamic> json) => Amounts(
        original: json["original"],
        refunded: json["refunded"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "refunded": refunded,
      };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata();

  Map<String, dynamic> toJson() => {};
}

class FeeDetail {
  String type;
  int amount;
  String feePayer;

  FeeDetail({
    required this.type,
    required this.amount,
    required this.feePayer,
  });

  factory FeeDetail.fromJson(Map<String, dynamic> json) => FeeDetail(
        type: json["type"],
        amount: json["amount"],
        feePayer: json["fee_payer"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "amount": amount,
        "fee_payer": feePayer,
      };
}

class Payer {
  Identification identification;
  dynamic entityType;
  Phone phone;
  dynamic lastName;
  String id;
  dynamic type;
  dynamic firstName;
  String email;

  Payer({
    required this.identification,
    required this.entityType,
    required this.phone,
    required this.lastName,
    required this.id,
    required this.type,
    required this.firstName,
    required this.email,
  });

  factory Payer.fromJson(Map<String, dynamic> json) => Payer(
        identification: Identification.fromJson(json["identification"]),
        entityType: json["entity_type"],
        phone: Phone.fromJson(json["phone"]),
        lastName: json["last_name"],
        id: json["id"],
        type: json["type"],
        firstName: json["first_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "identification": identification.toJson(),
        "entity_type": entityType,
        "phone": phone.toJson(),
        "last_name": lastName,
        "id": id,
        "type": type,
        "first_name": firstName,
        "email": email,
      };
}

class Phone {
  dynamic number;
  dynamic extension;
  dynamic areaCode;

  Phone({
    required this.number,
    required this.extension,
    required this.areaCode,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        number: json["number"],
        extension: json["extension"],
        areaCode: json["area_code"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "extension": extension,
        "area_code": areaCode,
      };
}

class PaymentMethod {
  String id;
  String type;
  String issuerId;
  Data data;

  PaymentMethod({
    required this.id,
    required this.type,
    required this.issuerId,
    required this.data,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: json["id"],
        type: json["type"],
        issuerId: json["issuer_id"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "issuer_id": issuerId,
        "data": data.toJson(),
      };
}

class Data {
  RoutingData routingData;

  Data({
    required this.routingData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        routingData: RoutingData.fromJson(json["routing_data"]),
      );

  Map<String, dynamic> toJson() => {
        "routing_data": routingData.toJson(),
      };
}

class RoutingData {
  String merchantAccountId;

  RoutingData({
    required this.merchantAccountId,
  });

  factory RoutingData.fromJson(Map<String, dynamic> json) => RoutingData(
        merchantAccountId: json["merchant_account_id"],
      );

  Map<String, dynamic> toJson() => {
        "merchant_account_id": merchantAccountId,
      };
}

class PointOfInteraction {
  String type;
  BusinessInfo businessInfo;

  PointOfInteraction({
    required this.type,
    required this.businessInfo,
  });

  factory PointOfInteraction.fromJson(Map<String, dynamic> json) =>
      PointOfInteraction(
        type: json["type"],
        businessInfo: BusinessInfo.fromJson(json["business_info"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "business_info": businessInfo.toJson(),
      };
}

class BusinessInfo {
  String unit;
  String subUnit;

  BusinessInfo({
    required this.unit,
    required this.subUnit,
  });

  factory BusinessInfo.fromJson(Map<String, dynamic> json) => BusinessInfo(
        unit: json["unit"],
        subUnit: json["sub_unit"],
      );

  Map<String, dynamic> toJson() => {
        "unit": unit,
        "sub_unit": subUnit,
      };
}

class Tax {
  int value;
  String type;

  Tax({
    required this.value,
    required this.type,
  });

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        value: json["value"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "type": type,
      };
}

class TransactionDetails {
  dynamic paymentMethodReferenceId;
  dynamic acquirerReference;
  int netReceivedAmount;
  int totalPaidAmount;
  int overpaidAmount;
  dynamic externalResourceUrl;
  int installmentAmount;
  dynamic financialInstitution;
  dynamic payableDeferralPeriod;

  TransactionDetails({
    required this.paymentMethodReferenceId,
    required this.acquirerReference,
    required this.netReceivedAmount,
    required this.totalPaidAmount,
    required this.overpaidAmount,
    required this.externalResourceUrl,
    required this.installmentAmount,
    required this.financialInstitution,
    required this.payableDeferralPeriod,
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) =>
      TransactionDetails(
        paymentMethodReferenceId: json["payment_method_reference_id"],
        acquirerReference: json["acquirer_reference"],
        netReceivedAmount: json["net_received_amount"],
        totalPaidAmount: json["total_paid_amount"],
        overpaidAmount: json["overpaid_amount"],
        externalResourceUrl: json["external_resource_url"],
        installmentAmount: json["installment_amount"],
        financialInstitution: json["financial_institution"],
        payableDeferralPeriod: json["payable_deferral_period"],
      );

  Map<String, dynamic> toJson() => {
        "payment_method_reference_id": paymentMethodReferenceId,
        "acquirer_reference": acquirerReference,
        "net_received_amount": netReceivedAmount,
        "total_paid_amount": totalPaidAmount,
        "overpaid_amount": overpaidAmount,
        "external_resource_url": externalResourceUrl,
        "installment_amount": installmentAmount,
        "financial_institution": financialInstitution,
        "payable_deferral_period": payableDeferralPeriod,
      };
}
