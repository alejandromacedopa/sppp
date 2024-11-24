import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  String text;
  Function() onPressed;
  Color color;
  Color? colorText;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double width;
  final Icon? icon;// Agrega el parámetro width

  DefaultButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.colorText = Colors.white,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.borderRadius = 8.0,
    this.icon, // Agregado parámetro de icono
    this.padding = const EdgeInsets.symmetric(vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Text(
          text,
          style: TextStyle(color: colorText),
        ),
      ),
    );
  }
}
