import 'package:flutter/material.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/bloc/LoginBloc.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/bloc/LoginEvent.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/bloc/LoginState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class LoginContent extends StatelessWidget {
  final LoginBloc? bloc;
  final LoginState state;

  LoginContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A3D62), // Fondo azul oscuro
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange, // Fondo amarillo del círculo
                ),
                child: Icon(
                  Icons.person, // Ícono de usuario
                  size: 92, // Tamaño ajustado del ícono
                  color: Color(0xFF0A3D62), // Color blanco del ícono
                ),
              ),
              SizedBox(height: 12), // Espaciado entre el ícono y el título
              Text(
                'Iniciar sesión',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Roboto', // Ajusta el tipo de letra
                ),
              ),
              SizedBox(height: 15), // Espaciado entre el título y el formulario
              _loginForm(context),
              SizedBox(
                  height: 10), // Espacio reducido entre el formulario y el logo
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10.0), // Ajuste del espacio con el borde inferior
                child: Image.asset(
                  'assets/img/upeuu.png', // Logo en la parte inferior
                  width: 140, // Tamaño del logo
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 25, vertical: 40), // Aumenta el padding vertical aquí
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: state.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _TextFieldEmail(),
            SizedBox(height: 20),
            _TextFieldPassword(),
            SizedBox(height: 10),
            _buttonLogin(context),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  // Acción para "¿Olvidaste tu contraseña?"
                },
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: Colors.grey[600],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _TextFieldEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
      ),
      onChanged: (text) {
        bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.email.error;
      },
    );
  }

  Widget _TextFieldPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
      ),
      obscureText: true,
      onChanged: (text) {
        bloc?.add(PasswordChanged(password: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.password.error;
      },
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          /*if (state.formKey!.currentState!.validate())*/ {
            //bloc!.add(LoginSubmit());
            Navigator.popAndPushNamed(context, "empresa/actividad");
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
