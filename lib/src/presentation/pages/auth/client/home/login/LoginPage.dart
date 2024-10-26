import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/LoginContent.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/bloc/LoginBloc.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/bloc/LoginEvent.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/bloc/LoginState.dart';

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
          final authResponse = responseState.data as AuthResponse;
          _bloc?.add(LoginFormReset());
          _bloc?.add(LoginSaveSession(authResponse: authResponse));
          Fluttertoast.showToast(
              msg: 'Login exitoso',
              toastLength: Toast.LENGTH_LONG); //toas de testeo
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.pushNamedAndRemoveUntil(
                context,
                'client/home',
                (route) =>
                    false); //enviar a la pagina de roles, despues de guardar el usuario
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
