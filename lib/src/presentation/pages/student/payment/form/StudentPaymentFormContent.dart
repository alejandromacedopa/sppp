
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/bloc/StudentPaymentFormBloc.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/bloc/StudentPaymentFormEvent.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/bloc/StudentPaymentFormState.dart';
import 'package:sppp/src/presentation/widget/DefaultTextField.dart';

class StudentPaymentFormContent extends StatelessWidget {
  StudentPaymentFormBloc? bloc;
  StudentPaymentFormState state;

  StudentPaymentFormContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _creditCardWidget(),
        _creditCardForm(),
        _dropdownIdentificationTypes(),
        _textFieldIdentificationNumber()
      ],
    );
  }

  Widget _textFieldIdentificationNumber() {
    return Container(
      margin: EdgeInsets.only(right: 17, left: 17, top: 5),
      child: DefaultTextField(
          label: 'Numero de identificacion',
          icon: Icons.document_scanner,
          color: Colors.grey,
          onChange: (text) {
            bloc?.add(IdentificationNumberChanged(identificationNumber: text));
          }),
    );
  }

  Widget _dropdownIdentificationTypes() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: DropdownButton(
          hint: Text(
            'Tipo de documento',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          value: state.identificationType,
          items: _dropDownItems(),
          onChanged: (value) {
            bloc?.add(IdentificationTypeChanged(identificationType: value!));
          }),
    );
  }

//LISTA DE LOS Type documents
  List<DropdownMenuItem<String>> _dropDownItems() {
    List<DropdownMenuItem<String>> list = [];
    state.identificationTypes.forEach((identification) {
      list.add(DropdownMenuItem(
        child: Container(
          margin: EdgeInsets.only(top: 7),
          child: Text(identification.name),
        ),
        value: identification.id,
      ));
    });
    return list;
  }

  Widget _creditCardForm() {
    return CreditCardForm(
      formKey: state.formKey ?? new GlobalKey(), // Required
      cardNumber: state.cardNumber, // Required
      expiryDate: state.expireDate, // Required
      cardHolderName: state.cardHolderName, // Required
      cvvCode: state.cvvCode, // Required
      onCreditCardModelChange: (CreditCardModel data) {
        bloc?.add(CreditCardChanged(
            cardNumber: data.cardNumber,
            expireDate: data.expiryDate,
            cardHolderName: data.cardHolderName,
            cvvCode: data.cvvCode,
            isCvvFocused: data.isCvvFocused));
      }, // Required
      obscureCvv: true,
      obscureNumber: true,
      isHolderNameVisible: true,
      isCardNumberVisible: true,
      isExpiryDateVisible: true,
      enableCvv: true,
      cvvValidationMessage: 'Please input a valid CVV',
      dateValidationMessage: 'Please input a valid date',
      numberValidationMessage: 'Please input a valid number',
      cardNumberValidator: (String? cardNumber) {},
      expiryDateValidator: (String? expiryDate) {},
      cvvValidator: (String? cvv) {},
      cardHolderValidator: (String? cardHolderName) {},
      onFormComplete: () {
        // callback to execute at the end of filling card data
      },
      autovalidateMode: AutovalidateMode.always,
      disableCardNumberAutoFillHints: false,
      inputConfiguration: const InputConfiguration(
        cardNumberDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Numero de la tarjeta',
          hintText: 'XXXX XXXX XXXX XXXX',
        ),
        expiryDateDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Fecha de expiracion',
          hintText: 'XX/XX',
        ),
        cvvCodeDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'CVV',
          hintText: 'XXX',
        ),
        cardHolderDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Propietario de la tarjeta',
        ),
        cardNumberTextStyle: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
        cardHolderTextStyle: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
        expiryDateTextStyle: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
        cvvCodeTextStyle: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _creditCardWidget() {
    return CreditCardWidget(
      cardNumber: state.cardNumber,
      expiryDate: state.expireDate,
      cardHolderName: state.cardHolderName,
      cvvCode: state.cvvCode,
      showBackView:
          state.isCvvFocused, //true when you want to show cvv(back) view
      onCreditCardWidgetChange: (CreditCardBrand
          brand) {}, // Callback for anytime credit card brand is changed
    );
  }
}
