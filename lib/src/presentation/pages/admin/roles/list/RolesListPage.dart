import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Roles.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/AdminRolesListItem.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/bloc/AdminRolesListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/bloc/AdminRolesListEvent.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/bloc/AdminRolesListState.dart';

class RolesListPage extends StatefulWidget {
  const RolesListPage({super.key});

  @override
  State<RolesListPage> createState() => _RolesListPageState();
}

class _RolesListPageState extends State<RolesListPage> {
  AdminRolesListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetRoles());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminRolesListBloc>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'create/roles');
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocListener<AdminRolesListBloc, AdminRolesListState>(
            listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            if (responseState.data is bool) {
              _bloc?.add(GetRoles());
            }
          }
          if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        }, child: BlocBuilder<AdminRolesListBloc, AdminRolesListState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              List<Roles> roles = responseState.data as List<Roles>;
              return ListView.builder(
                  itemCount: roles.length,
                  itemBuilder: (context, index) {
                    return AdminRolesListItem(_bloc, roles[index]);
                  });
            }
            return Container();
          },
        )));
  }
}
