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
        _backgroundColor(),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _iconStatus(),
                SizedBox(height: 10), // Menos espacio arriba
                _textInfo(),
                SizedBox(height: 10), // Menos espacio entre texto y logo
                _textStatus(),
                SizedBox(height: 5), // Menos espacio entre el texto y el mensaje
                _textMessage(),
                SizedBox(height: 5), // Menos espacio entre el mensaje y el logo
                _logo(),
                _buttonFinish(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonFinish(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15), // Ajuste de margen
      child: DefaultButton(
        text: 'Finalizar',
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, 'student/home', (route) => false);
        },
        color: Colors.white,
        colorText: Colors.black,
        borderRadius: 30,
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
    );
  }

  Widget _textMessage() {
    return paymentResponse?.status == 'approved'
        ? Text(
      'Mira los detalles de tu compra en mis compras',
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    )
        : Text(
      'Verifica los datos de tu tarjeta',
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _textStatus() {
    return paymentResponse?.status == 'approved'
        ? Text(
      'Tu orden fue procesada exitosamente usando (${paymentResponse?.payment_method_id})',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    )
        : Text(
      'Tu pago fue rechazado',
      style: TextStyle(
        color: Colors.redAccent,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _textInfo() {
    return paymentResponse?.status == 'approved'
        ? Text(
      'GRACIAS POR TU COMPRA',
      style: TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    )
        : Text(
      'Error en la transacción',
      style: TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _iconStatus() {
    return Container(
      margin: EdgeInsets.only(top: 30), // Menos espacio arriba del icono
      child: Icon(
        paymentResponse?.status == 'approved'
            ? Icons.check_circle
            : Icons.cancel,
        color: paymentResponse?.status == 'approved'
            ? Colors.white
            : Colors.redAccent,
        size: 150,
      ),
    );
  }

  Widget _backgroundColor() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.green, // Fondo azul marino
    );
  }

  Widget _logo() {
    return Container(
      margin: EdgeInsets.only(bottom: 10), // Menos espacio debajo del logo
      child: Image.asset(
        'assets/img/logofinal.png', // Aquí se pone el logo que agregarás
        width: 350, // Tamaño del logo
        height: 350, // Tamaño del logo
        fit: BoxFit.contain, // Asegura que la imagen no se distorsione
      ),
    );
  }
}
