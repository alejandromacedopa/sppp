import 'package:flutter/material.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/bloc/LoginBloc.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/bloc/LoginEvent.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/bloc/LoginState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';
import 'package:sppp/src/presentation/widget/DefaultIconBack.dart';
import 'package:sppp/src/presentation/widget/DefaultTextField.dart'; // Asegúrate de tener la importación

class LoginContent extends StatelessWidget {
  LoginBloc? bloc;
  LoginState state;

  LoginContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                color:
                    Colors.white.withOpacity(0.9), // Fondo blanco con opacidad
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  _textLogin(),
                  SizedBox(height: 10), // Espacio entre título y campos
                  _TextFieldEmail(),
                  SizedBox(height: 20),
                  _TextFieldPassword(),
                  SizedBox(height: 30), // Espacio mayor antes de los botones
                  _buttonLogin(context),
                  SizedBox(height: 10),
                  _buttonRegister(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Image.asset(
      'assets/img/logininicial.png',
      width: size.width,
      height: size.height,
      fit: BoxFit.cover,
      color: Colors.black54.withOpacity(0.7),
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _textLogin() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        '¡Hola de nuevo!',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _TextFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: Colors.grey[200], // Color de fondo para el campo de texto
          prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
        ),
        onChanged: (text) {
          bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.email.error;
        },
      ),
    );
  }

  Widget _TextFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Contraseña',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: Colors.grey[200], // Color de fondo para el campo de texto
          prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
        ),
        obscureText: true,
        onChanged: (text) {
          bloc?.add(PasswordChanged(password: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.password.error;
        },
      ),
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc!.add(LoginSubmit());
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow[700], // Color amarillo similar
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          'Ingresar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'register');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700], // Color azul similar
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          'Registrarse',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
