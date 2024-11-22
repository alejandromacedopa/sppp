import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/address/create/StudentAddressCreateContent.dart';
import 'package:sppp/src/presentation/pages/student/address/create/bloc/StudentAddressCreateBloc.dart';
import 'package:sppp/src/presentation/pages/student/address/create/bloc/StudentAddressCreateState.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListBloc.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListEvent.dart';

class StudentAddressCreatePage extends StatefulWidget {
  const StudentAddressCreatePage({super.key});

  @override
  State<StudentAddressCreatePage> createState() =>
      _StudentAddressCreatePageState();
}

class _StudentAddressCreatePageState extends State<StudentAddressCreatePage> {
  StudentAddressCreateBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<StudentAddressCreateBloc>(context);
    return Scaffold(
      body: BlocListener<StudentAddressCreateBloc, StudentAddressCreateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            context.read<StudentAddressListBloc>().add(GetUserAddress());
            // _bloc?.add(ResetForm());
            Fluttertoast.showToast(
                msg: 'La direccion se creo correctamente',
                toastLength: Toast.LENGTH_LONG);
            Navigator.pop(context);
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<StudentAddressCreateBloc, StudentAddressCreateState>(
          builder: (context, state) {
            return StudentAddressCreateContent(_bloc, state);
          },
        ),
      ),
    );
  }
}
