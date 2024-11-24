import 'package:flutter/material.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagState.dart';
import 'package:sppp/src/presentation/widget/DefaultButton.dart';

class StudentShoppingBagBottomBar extends StatelessWidget {
  final StudentShoppingBagState state;

  StudentShoppingBagBottomBar(this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, -2),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Precio Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                '\S/.${state.total.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
          SizedBox(height: 14),

          // Botón de Confirmar Orden
          Row(
            children: [
              Expanded(
                child: DefaultButton(
                  text: 'CONFIRMAR ORDEN',
                  onPressed: () {
                    Navigator.pushNamed(context, 'student/payment/form');
                  },
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  borderRadius: 10,
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
