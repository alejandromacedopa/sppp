import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class _AdminEnterpriseCreatePage extends State<AdminEnterpriseCreatePage> with SingleTickerProviderStateMixin {
  AdminEnterpriseCreateBloc? _bloc;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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

            _showCustomSnackbar(
              context,
              message: '¡Empresa creada exitosamente!',
              isSuccess: true,
            );
          } else if (responseState is Error) {
            _showCustomSnackbar(
              context,
              message: responseState.message,
              isSuccess: false,
            );
          }
        },
        child: BlocBuilder<AdminEnterpriseCreateBloc,
            AdminEnterpriseCreateState>(
          builder: (context, state) {
            return AdminEnterpriseCreateContent(_bloc, state);
          },
        ),
      ),
    );
  }

  void _showCustomSnackbar(BuildContext context,
      {required String message, required bool isSuccess}) {
    final gradientColors = isSuccess
        ? [Colors.green.shade400, Colors.green.shade700]
        : [Colors.redAccent.shade200, Colors.redAccent.shade400];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: EdgeInsets.zero,
        // Eliminamos el padding por defecto
        action: SnackBarAction(
          label: 'Cerrar',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        // Usamos el `Container` directamente en el `content` del SnackBar
        content: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(
                isSuccess ? Icons.check_circle_outline : Icons.error_outline,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
