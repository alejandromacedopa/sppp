import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/MercadoPagoPaymentResponse2.dart';
import 'package:sppp/src/presentation/widget/DefaultButton.dart';

class StudentPaymentStatusContent extends StatelessWidget {
  MercadoPagoPaymentResponse2? paymentResponse;

  StudentPaymentStatusContent(this.paymentResponse);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _imageBackground(context),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              _iconStatus(),
              SizedBox(height: 15),
              _textInfo(),
              SizedBox(height: 15),
              _textStatus(),
              SizedBox(height: 15),
              _textMessage(),
              Spacer(),
              _buttonFinish(context)
            ],
          ),
        )
      ],
    );
  }

  Widget _buttonFinish(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
      child: DefaultButton(
        text: 'Finalizar',
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, 'client/home', (route) => false);
        },
        color: Colors.white,
        colorText: Colors.black,
      ),
    );
  }

  Widget _textMessage() {
    return paymentResponse?.status == 'approved'
        ? Text(
            'Mira el estado de tu compra en mis compras',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          )
        : Text(
            'Verifica los datos de tu tarjeta',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          );
  }

  Widget _textStatus() {
    return paymentResponse?.status == 'approved'
        ? Text(
            'Tu orden fue procesado exitosamente usando (${paymentResponse?.payment_method_id})',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          )
        : Text(
            'Tu pago fue rechazado',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          );
  }

  Widget _textInfo() {
    return paymentResponse?.status == 'approved'
        ? Text(
            'GRACIAS POR TU COMPRA',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )
        : Text(
            'Error en la transaccion',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          );
  }

  Widget _iconStatus() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Icon(
        paymentResponse?.status == 'approved'
            ? Icons.check_circle
            : Icons.cancel,
        color: Colors.grey[200],
        size: 150,
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background_shopping.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.6),
      colorBlendMode: BlendMode.darken,
    );
  }
}
