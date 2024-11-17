import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/AdminEnterpriseUpdateContent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/bloc/AdminEnterpriseUpdateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/bloc/AdminEnterpriseUpdateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/bloc/AdminEnterpriseUpdateState.dart';

class AdminEnterpriseUpdatePage extends StatefulWidget {
  const AdminEnterpriseUpdatePage({super.key});

  @override
  State<AdminEnterpriseUpdatePage> createState() =>
      _AdminEnterpriseUpdatePage();
}

class _AdminEnterpriseUpdatePage extends State<AdminEnterpriseUpdatePage> {
  Enterprise? enterprise;
  late AdminEnterpriseUpdateBloc _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (enterprise != null) {
        _bloc.add(AdminEnterpriseUpdateInitEvent(enterprise: enterprise!));
      }
    });
  }

  @override
  void dispose() {
    _bloc.add(ResetForm());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminEnterpriseUpdateBloc>(context);
    enterprise = ModalRoute.of(context)?.settings.arguments as Enterprise?;

    return Scaffold(
      body: BlocListener<AdminEnterpriseUpdateBloc, AdminEnterpriseUpdateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            context.read<AdminEnterpriseListBloc>().add(GetEnterprise());
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: 'La Empresa se actualizó correctamente',
                toastLength: Toast.LENGTH_LONG);
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<AdminEnterpriseUpdateBloc, AdminEnterpriseUpdateState>(
          builder: (context, state) {
            if (enterprise == null) {
              return const Center(child: Text('No se proporcionaron datos de la empresa'));
            }
            return AdminEnterpriseUpdateContent(_bloc, state, enterprise!);
          },
        ),
      ),
    );
  }
}
