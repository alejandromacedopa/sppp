import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Evidence.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/evidences/list/AdminEvidenceListItem.dart';
import 'package:sppp/src/presentation/pages/student/evidences/list/bloc/AdminEvidenceListBloc.dart';
import 'package:sppp/src/presentation/pages/student/evidences/list/bloc/AdminEvidenceListEvent.dart';
import 'package:sppp/src/presentation/pages/student/evidences/list/bloc/AdminEvidenceListState.dart';

class AdminEvidenceListPage extends StatefulWidget {
  const AdminEvidenceListPage({super.key});

  @override
  State<AdminEvidenceListPage> createState() => _AdminEvidenceListPage();
}

class _AdminEvidenceListPage extends State<AdminEvidenceListPage> {
  AdminEvidenceListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc?.add(GetEvidences());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminEvidenceListBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: BlocListener<AdminEvidenceListBloc, AdminEvidenceListState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              if (responseState.data is bool) {
                _bloc?.add(GetEvidences());
              }
            }
            if (responseState is Error) {
              Fluttertoast.showToast(
                msg: responseState.message,
                toastLength: Toast.LENGTH_LONG,
              );
            }
          },
          child: BlocBuilder<AdminEvidenceListBloc, AdminEvidenceListState>(
            builder: (context, state) {
              final responseState = state.response;
              if (responseState is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (responseState is Success) {
                List<Evidence> evidences = responseState.data as List<Evidence>;
                return ListView.builder(
                  itemCount: evidences.length,
                  itemBuilder: (context, index) {
                    return AdminEvidenceListItem(_bloc, evidences[index]);
                  },
                );
              }
              return const Center(
                child: Text("No hay datos disponibles."),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'admin/evidences/create');
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
