
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/AdminEnterpriseCreateContent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateState.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListEvent.dart';

class AdminEnterpriseCreatePage extends StatefulWidget {
  const AdminEnterpriseCreatePage({super.key});

  @override
  State<AdminEnterpriseCreatePage> createState() => _AdminEnterpriseCreatePage();
}

class _AdminEnterpriseCreatePage extends State<AdminEnterpriseCreatePage> {
  AdminEnterpriseCreateBloc? _bloc;
  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminEnterpriseCreateBloc>(context);
    return Scaffold(
      body: BlocListener<AdminEnterpriseCreateBloc, AdminEnterpriseCreateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            context.read<AdminEnterpriseListBloc>().add(GetEnterprise());
            _bloc?.add(ResetForm());
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: 'La Empresa se creo correctamente',
                toastLength: Toast.LENGTH_LONG);
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<AdminEnterpriseCreateBloc, AdminEnterpriseCreateState>(
          builder: (context, state) {
            return AdminEnterpriseCreateContent(_bloc, state);
          },
        ),
      ),
    );
  }
}
