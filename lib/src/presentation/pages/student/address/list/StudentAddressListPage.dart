import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Address.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/address/list/StudentAddressListItem.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListBloc.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListEvent.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListState.dart';

class StudentAddressListPage extends StatefulWidget {
  const StudentAddressListPage({super.key});

  @override
  State<StudentAddressListPage> createState() => _StudentAddressListPageState();
}

class _StudentAddressListPageState extends State<StudentAddressListPage> {
  StudentAddressListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetUserAddress());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<StudentAddressListBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Mis direcciones'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'student/address/create');
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'student/payment/form');
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
        body: BlocListener<StudentAddressListBloc, StudentAddressListState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              if (responseState.data is bool) {
                // SI LA DIRECCION SE BORRO CORRECTAMENTE
                _bloc?.add(GetUserAddress());
              }
            }
            if (responseState is Error) {
              Fluttertoast.showToast(
                  msg: responseState.message, toastLength: Toast.LENGTH_LONG);
            }
          },
          child: BlocBuilder<StudentAddressListBloc, StudentAddressListState>(
            builder: (context, state) {
              final responseState = state.response;
              if (responseState is Success) {
                List<Address> address = responseState.data as List<Address>;
                _bloc?.add(SetAddressSession(addressList: address));
                return ListView.builder(
                    itemCount: address.length,
                    itemBuilder: (context, index) {
                      return StudentAddressListItem(
                          _bloc, state, address[index], index);
                    });
              }
              return Container();
            },
          ),
        ));
  }
}
