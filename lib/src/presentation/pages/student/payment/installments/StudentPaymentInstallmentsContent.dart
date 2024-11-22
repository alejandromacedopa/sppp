import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:sppp/src/domain/models/MercadoPagoInstallments.dart';
import 'package:sppp/src/presentation/pages/student/payment/installments/bloc/StudentPaymentInstallmentsBloc.dart';
import 'package:sppp/src/presentation/pages/student/payment/installments/bloc/StudentPaymentInstallmentsEvent.dart';
import 'package:sppp/src/presentation/pages/student/payment/installments/bloc/StudentPaymentInstallmentsState.dart';
import 'package:sppp/src/presentation/widget/DefaultButton.dart';

class StudentPaymentInstallmentsContent extends StatelessWidget {
  StudentPaymentInstallmentsBloc? bloc;
  StudentPaymentInstallmentsState state;
  MercadoPagoInstallments mercadoPagoInstallments;
  MercadoPagoCardTokenResponse mercadoPagoCardTokenResponse;

  StudentPaymentInstallmentsContent(this.bloc, this.state,
      this.mercadoPagoInstallments, this.mercadoPagoCardTokenResponse);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textInstallments(),
          _dropdownInstallments(),
          Spacer(),
          _buttonPay()
        ],
      ),
    );
  }

  Widget _buttonPay() {
    return Container(
      child: DefaultButton(
          text: 'PAGAR',
          onPressed: () {
            bloc?.add(FormSubmit(
                mercadoPagoCardTokenResponse: mercadoPagoCardTokenResponse,
                installments: mercadoPagoInstallments));
          }),
    );
  }

  Widget _textInstallments() {
    return Text(
      'Elije el numero de coutas',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
    );
  }

  Widget _dropdownInstallments() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: DropdownButton(
          hint: Text(
            'Numero de Coutas',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          value: state.installment,
          items: _dropDownItems(),
          onChanged: (value) {
            bloc?.add(InstallmentChanged(installment: value!));
          }),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItems() {
    List<DropdownMenuItem<String>> list = [];
    mercadoPagoInstallments.payerCosts.forEach((installment) {
      list.add(DropdownMenuItem(
        child: Container(
          margin: EdgeInsets.only(top: 7),
          child: Text(installment.recommendedMessage),
        ),
        value: installment.installments.toString(),
      ));
    });
    return list;
  }
}
