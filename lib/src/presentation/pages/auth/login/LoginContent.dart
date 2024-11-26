import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:sppp/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:sppp/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class LoginContent extends StatefulWidget {
  final LoginBloc? bloc;
  final LoginState state;

  LoginContent(this.bloc, this.state);

  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
          Container(
            width: MediaQuery.of(context).size.width * 0.80, // Ajusté el ancho
            height: MediaQuery.of(context).size.height * 0.55, // Ajusté la altura
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.8), // Más suave
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _logoPlaceholder(),
                _textFieldEmail(),
                _textFieldPassword(),
                _buttonLogin(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoPlaceholder() {
    return Container(
      margin: EdgeInsets.only(bottom: 10), // Ajusté el margen inferior
      child: Image.asset(
        'assets/img/logofinal.png',
        width: 220, // Reducido el tamaño del logo
        height: 220,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10), // Ajusté el margen vertical
      child: ElevatedButton(
        onPressed: () {
          if (widget.state.formKey!.currentState!.validate()) {
            widget.bloc?.add(LoginSubmit());
          } else {
            Fluttertoast.showToast(
              msg: 'El formulario no es válido',
              toastLength: Toast.LENGTH_LONG,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E3A8A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
        child: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8), // Reducido el margen
      child: TextFormField(
        obscureText: _obscurePassword,
        onChanged: (text) {
          widget.bloc?.add(PasswordChanged(password: BlocFormItem(value: text)));
        },
        validator: (value) {
          return widget.state.password.error;
        },
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          labelText: 'Contraseña',
          labelStyle: TextStyle(
            color: Colors.blueGrey.shade700,
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.blue.shade800,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.blue.shade800,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade800),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blueGrey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade800),
          ),
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8), // Reducido el margen
      child: TextFormField(
        onChanged: (text) {
          widget.bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
        },
        validator: (value) {
          return widget.state.email.error;
        },
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          labelText: 'Correo Electrónico',
          labelStyle: TextStyle(
            color: Colors.blueGrey.shade700,
          ),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.blue.shade800,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade800),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blueGrey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade800),
          ),
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/hotel.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.6),
      colorBlendMode: BlendMode.darken,
    );
  }
}
