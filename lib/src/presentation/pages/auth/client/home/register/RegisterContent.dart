import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/register/bloc/RegisterBloc.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/register/bloc/RegisterEvent.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/register/bloc/RegisterState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';
import 'package:sppp/src/presentation/widget/DefaultIconBack.dart';
import 'package:sppp/src/presentation/widget/DefaultTextField.dart';

class RegisterContent extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;

  RegisterContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/img/upeu.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.80,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 125,
                ),
                Text(
                  'REGISTER',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: DefaultTextField(
                      label: 'nombre',
                      icon: Icons.person,
                      onChange: (text) {
                        //print('Text: ${text}');
                        bloc?.add(RegisterNameChanged(
                            name: BlocFormItem(value: text)));
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: DefaultTextField(
                      label: 'apellidos',
                      icon: Icons.person_outline,
                      onChange: (text) {
                        //print('Text: ${text}');
                        bloc?.add(RegisterLastNameChanged(
                            lastname: BlocFormItem(value: text)));
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: DefaultTextField(
                    label: 'email',
                    icon: Icons.email,
                    onChange: (text) {
                      bloc?.add(RegisterEmailChanged(
                          email: BlocFormItem(value: text)));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: DefaultTextField(
                    label: 'telefono',
                    icon: Icons.phone,
                    onChange: (text) {
                      bloc?.add(RegisterPhoneChanged(
                          phone: BlocFormItem(value: text)));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: DefaultTextField(
                    label: 'password',
                    icon: Icons.lock,
                    onChange: (text) {
                      bloc?.add(RegisterPasswordChanged(
                          password: BlocFormItem(value: text)));
                    },
                    obscureText: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: DefaultTextField(
                    label: 'confirm password',
                    icon: Icons.lock_outline,
                    onChange: (text) {
                      bloc?.add(RegisterConfirmPasswordChanged(
                          confirmpassword: BlocFormItem(value: text)));
                    },
                    obscureText: true,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
                  child: ElevatedButton(
                      onPressed: () {
                        if (state.formKey!.currentState!.validate()) {
                          bloc?.add(RegisterFormSubmit());
                        } else {
                          Fluttertoast.showToast(
                              msg: 'el formulario no es valido',
                              toastLength: Toast.LENGTH_LONG);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: Text(
                        'Registrese',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
          DefaultIconBack(left: 70, top: 100),
        ],
      ),
    );
  }
}
