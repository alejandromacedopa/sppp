import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  String label;
  String? errorText;
  String? initialValue;
  TextInputType? textInputType;
  Color? color;
  IconData icon;
  bool obscureText;
  Function(String text) onChange;
  String? Function (String?)? validator;

  DefaultTextField({
    Key? key,
    required this.label,
    this.errorText,
    this.validator,
    this.initialValue,
    this.textInputType,
    this.color = Colors.white,
    required this.icon,
    required this.onChange,
    this.obscureText = false,
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        initialValue: initialValue,
        onChanged: (text){
          onChange(text);
        },
        keyboardType: textInputType,
        validator: validator,
        decoration: InputDecoration(
          label: Text(label, style: TextStyle(color: color)),
          errorText: errorText,
          prefixIcon: Icon(icon, color: color),
          enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: color!)),
          focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: color!)),
        ),
        style: TextStyle(color: color));
  }
}