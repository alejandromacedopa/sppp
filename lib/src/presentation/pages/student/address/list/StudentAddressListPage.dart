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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc?.add(GetUserAddress());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<StudentAddressListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mis direcciones',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue[900], // Azul marino
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'student/address/create');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'student/payment/form');
        },
        backgroundColor: Colors.blue[900], // Azul marino
        child: const Icon(Icons.check, color: Colors.white),
      ),
      body: BlocListener<StudentAddressListBloc, StudentAddressListState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            if (responseState.data is bool) {
              _bloc?.add(GetUserAddress());
            }
          } else if (responseState is Error) {
            Fluttertoast.showToast(
              msg: responseState.message,
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
        },
        child: BlocBuilder<StudentAddressListBloc, StudentAddressListState>(
          builder: (context, state) {
            final responseState = state.response;

            if (responseState is Success) {
              List<Address> addresses = responseState.data as List<Address>;
              _bloc?.add(SetAddressSession(addressList: addresses));

              if (addresses.isEmpty) {
                return const Center(
                  child: Text(
                    'No tienes direcciones guardadas',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                itemCount: addresses.length,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                itemBuilder: (context, index) {
                  return StudentAddressListItem(
                      _bloc, state, addresses[index], index);
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          },
        ),
      ),
    );
  }
}
