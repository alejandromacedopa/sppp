import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/AdminEnterpriseListItem.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListState.dart';

class AdminEnterpriseListPage extends StatefulWidget {
  const AdminEnterpriseListPage({super.key});

  @override
  State<AdminEnterpriseListPage> createState() => _AdminEnterpriseListPage();
}

class _AdminEnterpriseListPage extends State<AdminEnterpriseListPage> {
  AdminEnterpriseListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetEnterprise());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminEnterpriseListBloc>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'admin/enterprise/create');
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocListener<AdminEnterpriseListBloc, AdminEnterpriseListState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              if (responseState.data is bool) {
                _bloc?.add(GetEnterprise());
              }
            }
            if (responseState is Error) {
              Fluttertoast.showToast(
                  msg: responseState.message, toastLength: Toast.LENGTH_LONG);
            }
          },
          child: BlocBuilder<AdminEnterpriseListBloc, AdminEnterpriseListState>(
            builder: (context, state) {
              final responseState = state.response;
              if (responseState is Success) {
                List<Enterprise> enterprise = responseState.data as List<Enterprise>;
                return ListView.builder(
                    itemCount: enterprise.length,
                    itemBuilder: (context, index) {
                      return AdminEnterpriseListItem(_bloc, enterprise[index]);
                    });
              }
              return Container();
            },
          ),
        ));
  }
}
