import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:sppp/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:sppp/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';
import 'package:sppp/src/presentation/widget/DefaultTextField.dart';

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
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(150))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // VERTICAL
              crossAxisAlignment: CrossAxisAlignment.center, // HORIZANTAL
              children: [
                _iconPerson(),
                _textLogin(),
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

  Widget _iconPerson() {
    return Icon(
      Icons.login,
      color: Colors.white,
      size: 125,
    );
  }

  Widget _textLogin() {
    return Text(
      'Welcome Back !',
      style: TextStyle(
          color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
        child: ElevatedButton(
          onPressed: () {
            if (state.formKey!.currentState!.validate()) {
              bloc?.add(LoginSubmit());
            } else {
              Fluttertoast.showToast(
                  msg: 'El formulario no es valido',
                  toastLength: Toast.LENGTH_LONG);
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 42, 65, 139)),
          child: Text(
            'Sign In',
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255), fontSize: 20),
          ),
        ));
  }

  Widget _textFieldPassword() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
          label: 'Contraseña',
          icon: Icons.lock,
          // errorText: snapshot.error?.toString(),
          onChange: (text) {
            bloc?.add(PasswordChanged(password: BlocFormItem(value: text)));
          },
          obscureText: true,
          validator: (value) {
            return state.password.error;
          },
        ));
  }

  Widget _textFieldEmail() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
          label: 'Correo electronico',
          icon: Icons.email,
          // errorText: snapshot.error?.toString(),
          onChange: (text) {
            bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
          },
          validator: (value) {
            return state.email.error;
          },
        ));
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/hotel.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
