import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/domain/models/User.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/AdminEnterpriseListItem.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListState.dart';
import 'package:sppp/src/presentation/pages/admin/users/list/AdminUsersListItem.dart';
import 'package:sppp/src/presentation/pages/admin/users/list/bloc/AdminUsersListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/users/list/bloc/AdminUsersListItemEvent.dart';
import 'package:sppp/src/presentation/pages/admin/users/list/bloc/AdminUsersListState.dart';

class AdminUsersListPage extends StatefulWidget {
  const AdminUsersListPage({super.key});

  @override
  State<AdminUsersListPage> createState() => _AdminUsersListPage();
}

class _AdminUsersListPage extends State<AdminUsersListPage> {
  AdminUsersListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetUsers());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminUsersListBloc>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'admin/use/create');
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
                _bloc?.add(GetUsers());
              }
            }
            if (responseState is Error) {
              Fluttertoast.showToast(
                  msg: responseState.message, toastLength: Toast.LENGTH_LONG);
            }
          },
          child: BlocBuilder<AdminUsersListBloc, AdminUsersListState>(
            builder: (context, state) {
              final responseState = state.response;
              if (responseState is Success) {
                List<User> user = responseState.data as List<User>;
                return ListView.builder(
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      return AdminUsersListItem(_bloc, user[index]);
                    });
              }
              return Container();
            },
          ),
        ));
  }
}
