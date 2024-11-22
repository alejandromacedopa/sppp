import 'package:flutter/material.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagState.dart';
import 'package:sppp/src/presentation/widget/DefaultButton.dart';

class StudentShoppingBagBottomBar extends StatelessWidget {
 StudentShoppingBagState state;

  StudentShoppingBagBottomBar(this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.grey[200],
      child: Column(
        children: [
          Divider(
            color: Colors.grey[300],
            height: 0,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'TOTAL: \S/.${state.total}',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 180,
                child: DefaultButton(
                    text: 'CONFIRMAR ORDEN',
                    onPressed: () {
                      Navigator.pushNamed(context, 'student/payment/form');
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
