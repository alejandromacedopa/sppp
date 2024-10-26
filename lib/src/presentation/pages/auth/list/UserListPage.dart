import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/User.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/auth/list/AdminUserListItem.dart';
import 'package:sppp/src/presentation/pages/auth/list/bloc/AdminUserListBloc.dart';
import 'package:sppp/src/presentation/pages/auth/list/bloc/AdminUserListEvent.dart';
import 'package:sppp/src/presentation/pages/auth/list/bloc/AdminUserListState.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  AdminUserListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetUser());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminUserListBloc>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'create');
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocListener<AdminUserListBloc, AdminUserListState>(
            listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            if (responseState.data is bool) {
              _bloc?.add(GetUser());
            }
          }
          if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        }, child: BlocBuilder<AdminUserListBloc, AdminUserListState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              List<User> user = responseState.data as List<User>;
              return ListView.builder(
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return AdminUserListItem(_bloc, user[index]);
                  });
            }
            return Container();
          },
        )));
  }
}
