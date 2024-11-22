import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/MercadoPagoPaymentResponse2.dart';
import 'package:sppp/src/presentation/pages/student/payment/status/ClientPaymentStatusContent.dart';

class StudentPaymentStatusPage extends StatefulWidget {
  const StudentPaymentStatusPage({super.key});

  @override
  State<StudentPaymentStatusPage> createState() =>
      _ClientPaymentStatusPageState();
}

class _ClientPaymentStatusPageState extends State<StudentPaymentStatusPage> {
  MercadoPagoPaymentResponse2? paymentResponse;

  @override
  Widget build(BuildContext context) {
    paymentResponse = ModalRoute.of(context)?.settings.arguments
        as MercadoPagoPaymentResponse2;
    return Scaffold(
      body: StudentPaymentStatusContent(paymentResponse),
    );
  }
}
