import 'dart:convert';

MercadoPagoInstallments mercadoPagoInstallmentsFromJson(String str) => MercadoPagoInstallments.fromJson(json.decode(str));

String mercadoPagoInstallmentsToJson(MercadoPagoInstallments data) => json.encode(data.toJson());

class MercadoPagoInstallments {
    String paymentMethodId;
    String paymentTypeId;
    Issuer issuer;
    String processingMode;
    dynamic merchantAccountId;
    List<PayerCost> payerCosts;
    dynamic agreements;

    MercadoPagoInstallments({
        required this.paymentMethodId,
        required this.paymentTypeId,
        required this.issuer,
        required this.processingMode,
        required this.merchantAccountId,
        required this.payerCosts,
        required this.agreements,
    });

    factory MercadoPagoInstallments.fromJson(Map<String, dynamic> json) => MercadoPagoInstallments(
        paymentMethodId: json["payment_method_id"],
        paymentTypeId: json["payment_type_id"],
        issuer: Issuer.fromJson(json["issuer"]),
        processingMode: json["processing_mode"],
        merchantAccountId: json["merchant_account_id"],
        payerCosts: List<PayerCost>.from(json["payer_costs"].map((x) => PayerCost.fromJson(x))),
        agreements: json["agreements"],
    );

    Map<String, dynamic> toJson() => {
        "payment_method_id": paymentMethodId,
        "payment_type_id": paymentTypeId,
        "issuer": issuer.toJson(),
        "processing_mode": processingMode,
        "merchant_account_id": merchantAccountId,
        "payer_costs": List<dynamic>.from(payerCosts.map((x) => x.toJson())),
        "agreements": agreements,
    };
}

class Issuer {
    String id;
    String name;
    String secureThumbnail;
    String thumbnail;

    Issuer({
        required this.id,
        required this.name,
        required this.secureThumbnail,
        required this.thumbnail,
    });

    factory Issuer.fromJson(Map<String, dynamic> json) => Issuer(
        id: json["id"],
        name: json["name"],
        secureThumbnail: json["secure_thumbnail"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "secure_thumbnail": secureThumbnail,
        "thumbnail": thumbnail,
    };
}

class PayerCost {
    int installments;
    int installmentRate;
    int discountRate;
    dynamic reimbursementRate;
    List<String> labels;
    List<InstallmentRateCollector> installmentRateCollector;
    int minAllowedAmount;
    int maxAllowedAmount;
    String recommendedMessage;
    double installmentAmount;
    int totalAmount;
    PaymentMethodOptionId paymentMethodOptionId;

    PayerCost({
        required this.installments,
        required this.installmentRate,
        required this.discountRate,
        required this.reimbursementRate,
        required this.labels,
        required this.installmentRateCollector,
        required this.minAllowedAmount,
        required this.maxAllowedAmount,
        required this.recommendedMessage,
        required this.installmentAmount,
        required this.totalAmount,
        required this.paymentMethodOptionId,
    });

    factory PayerCost.fromJson(Map<String, dynamic> json) => PayerCost(
        installments: json["installments"],
        installmentRate: json["installment_rate"],
        discountRate: json["discount_rate"],
        reimbursementRate: json["reimbursement_rate"],
        labels: List<String>.from(json["labels"].map((x) => x)),
        installmentRateCollector: List<InstallmentRateCollector>.from(json["installment_rate_collector"].map((x) => installmentRateCollectorValues.map[x]!)),
        minAllowedAmount: json["min_allowed_amount"],
        maxAllowedAmount: json["max_allowed_amount"],
        recommendedMessage: json["recommended_message"],
        installmentAmount: json["installment_amount"]?.toDouble(),
        totalAmount: json["total_amount"],
        paymentMethodOptionId: paymentMethodOptionIdValues.map[json["payment_method_option_id"]]!,
    );

    Map<String, dynamic> toJson() => {
        "installments": installments,
        "installment_rate": installmentRate,
        "discount_rate": discountRate,
        "reimbursement_rate": reimbursementRate,
        "labels": List<dynamic>.from(labels.map((x) => x)),
        "installment_rate_collector": List<dynamic>.from(installmentRateCollector.map((x) => installmentRateCollectorValues.reverse[x])),
        "min_allowed_amount": minAllowedAmount,
        "max_allowed_amount": maxAllowedAmount,
        "recommended_message": recommendedMessage,
        "installment_amount": installmentAmount,
        "total_amount": totalAmount,
        "payment_method_option_id": paymentMethodOptionIdValues.reverse[paymentMethodOptionId],
    };
}

enum InstallmentRateCollector {
    MERCADOPAGO,
    THIRD_PARTY
}

final installmentRateCollectorValues = EnumValues({
    "MERCADOPAGO": InstallmentRateCollector.MERCADOPAGO,
    "THIRD_PARTY": InstallmentRateCollector.THIRD_PARTY
});

enum PaymentMethodOptionId {
    THE_1_A_QOK_O_DLL_ZJ_QY_NJKT_YJ_AZ_MY00_OWU1_LW_JH_MW_QT_NDE0_NJ_QY_NTM3_MZ_Y4_E_JA_FUEV_H_LG
}

final paymentMethodOptionIdValues = EnumValues({
    "1.AQokODllZjQyNjktYjAzMy00OWU1LWJhMWQtNDE0NjQyNTM3MzY4EJaFuevHLg": PaymentMethodOptionId.THE_1_A_QOK_O_DLL_ZJ_QY_NJKT_YJ_AZ_MY00_OWU1_LW_JH_MW_QT_NDE0_NJ_QY_NTM3_MZ_Y4_E_JA_FUEV_H_LG
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
