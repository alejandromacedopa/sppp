import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:sppp/src/domain/models/MercadoPagoInstallments.dart';
import 'package:sppp/src/domain/models/MercadoPagoPaymentResponse2.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/payment/installments/StudentPaymentInstallmentsContent.dart';
import 'package:sppp/src/presentation/pages/student/payment/installments/bloc/StudentPaymentInstallmentsBloc.dart';
import 'package:sppp/src/presentation/pages/student/payment/installments/bloc/StudentPaymentInstallmentsEvent.dart';
import 'package:sppp/src/presentation/pages/student/payment/installments/bloc/StudentPaymentInstallmentsState.dart';

class StudentPaymentInstallmentsPage extends StatefulWidget {
  const StudentPaymentInstallmentsPage({super.key});

  @override
  State<StudentPaymentInstallmentsPage> createState() =>
      _ClientPaymentInstallmentsPageState();
}

class _ClientPaymentInstallmentsPageState
    extends State<StudentPaymentInstallmentsPage> {
  StudentPaymentInstallmentsBloc? _bloc;
  MercadoPagoCardTokenResponse? mercadoPagoCardTokenResponse;
  String? amount;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetInstallments(
          firstSixDigits: mercadoPagoCardTokenResponse!.firstSixDigits,
          amount: amount!));
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    mercadoPagoCardTokenResponse = arguments['mercadoPagoCardTokenResponse']
        as MercadoPagoCardTokenResponse;
    amount = arguments['amount'] as String;
    _bloc = BlocProvider.of<StudentPaymentInstallmentsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ultimo paso'),
        backgroundColor: Colors.grey[200],
      ),
      body: BlocListener<StudentPaymentInstallmentsBloc,
          StudentPaymentInstallmentsState>(
        listener: (context, state) {
          final responsePayment = state.responsePayment;
          if (responsePayment is Success) {
            MercadoPagoPaymentResponse2 mercadoPagoPaymentResponse =
                responsePayment.data as MercadoPagoPaymentResponse2;
            print('response payment:${mercadoPagoPaymentResponse.toJson()}');
            Navigator.pushNamedAndRemoveUntil(
                context, 'client/payment/status', (route) => false,
                arguments: mercadoPagoPaymentResponse);
          } else if (responsePayment is Error) {
            Fluttertoast.showToast(
                msg: responsePayment.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<StudentPaymentInstallmentsBloc,
            StudentPaymentInstallmentsState>(
          builder: (context, state) {
            final responseState = state.responseInstallments;
            if (responseState is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (responseState is Success) {
              MercadoPagoInstallments installments =
                  responseState.data as MercadoPagoInstallments;
              return StudentPaymentInstallmentsContent(
                  _bloc, state, installments, mercadoPagoCardTokenResponse!);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
