
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/StudentPaymentFormContent.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/bloc/StudentPaymentFormBloc.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/bloc/StudentPaymentFormEvent.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/bloc/StudentPaymentFormState.dart';
import 'package:sppp/src/presentation/widget/DefaultButton.dart';

class StudentPaymentFormPage extends StatefulWidget {
  const StudentPaymentFormPage({super.key});

  @override
  State<StudentPaymentFormPage> createState() => _StudentPaymentFormPageState();
}

class _StudentPaymentFormPageState extends State<StudentPaymentFormPage> {
  StudentPaymentFormBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<StudentPaymentFormBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de pagos'),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 15, left: 30, right: 30),
        child: DefaultButton(
            text: 'Continuar',
            onPressed: () {
              _bloc?.add(FormSubmit());
            }),
      ),
      body: BlocListener<StudentPaymentFormBloc, StudentPaymentFormState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            // _bloc?.add(ResetForm());
            MercadoPagoCardTokenResponse response =
                responseState.data as MercadoPagoCardTokenResponse;
            print('Respuesta Card Token: ${response.toJson()}');
            Navigator.pushNamedAndRemoveUntil(
                context, 'client/payment/installments', (route) => false,
                arguments: {
                  'mercadoPagoCardTokenResponse': response,
                  'amount': state.totalToPay.toString()
                });
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<StudentPaymentFormBloc, StudentPaymentFormState>(
          builder: (context, state) {
            return StudentPaymentFormContent(_bloc, state);
          },
        ),
      ),
    );
  }
}
