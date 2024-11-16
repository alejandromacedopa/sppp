
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:sppp/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:sppp/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:sppp/src/presentation/pages/auth/login/bloc/LoginState.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _bloc;

  @override
  void initState() {
    // ejecuta una sola vez cuando carga la pantalla
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
        body: Container(
          width: double.infinity,
          child: BlocListener<LoginBloc, LoginState>(listener: (context, state) {
            final responseState = state.response;
            if (responseState is Error) {
              Fluttertoast.showToast(
                  msg: responseState.message, toastLength: Toast.LENGTH_LONG);
            } else if (responseState is Success) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                final authResponse = responseState.data as AuthResponse;
                print('USUARIO DE SESION: ${authResponse?.toJson()}');
                 _bloc?.add(LoginFormReset());
                _bloc?.add(LoginSaveSession(authResponse: authResponse));
                Navigator.pushNamedAndRemoveUntil(
                    context, 'roles', (route) => false);
              });
            }
          }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Stack(
                children: [
                  LoginContent(_bloc, state),
                  Center(child: CircularProgressIndicator())
                ],
              );
            }
            return LoginContent(_bloc, state);
          })),
        ));
  }
}
