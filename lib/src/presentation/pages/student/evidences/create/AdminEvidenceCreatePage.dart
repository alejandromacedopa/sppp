import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/evidences/create/AdminEvidenceCreateContent.dart';
import 'package:sppp/src/presentation/pages/student/evidences/create/bloc/AdminEvidenceCreateBloc.dart';
import 'package:sppp/src/presentation/pages/student/evidences/create/bloc/AdminEvidenceCreateEvent.dart';
import 'package:sppp/src/presentation/pages/student/evidences/create/bloc/AdminEvidenceCreateState.dart';

class AdminEvidenceCreatePage extends StatefulWidget {
  const AdminEvidenceCreatePage({super.key});

  @override
  State<AdminEvidenceCreatePage> createState() => _AdminEvidenceCreatePage();
}

class _AdminEvidenceCreatePage extends State<AdminEvidenceCreatePage> {
  AdminEvidenceCreateBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(AdminEvidenceCreateInitEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminEvidenceCreateBloc>(context);
    return Scaffold(
      body: BlocListener<AdminEvidenceCreateBloc, AdminEvidenceCreateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            Fluttertoast.showToast(
                msg: 'La Evidencia se creó correctamente',
                toastLength: Toast.LENGTH_LONG);
            _bloc?.add(ResetForm());
            Navigator.pop(context);
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<AdminEvidenceCreateBloc, AdminEvidenceCreateState>(
          builder: (context, state) {
            return AdminEvidenceCreateContent(_bloc, state);
          },
        ),
      ),
    );
  }
}
