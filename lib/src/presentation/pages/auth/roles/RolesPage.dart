import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/models/Roles.dart';
import 'package:sppp/src/presentation/pages/auth/roles/RolesItem.dart';
import 'package:sppp/src/presentation/pages/auth/roles/bloc/RolesBloc.dart';
import 'package:sppp/src/presentation/pages/auth/roles/bloc/RolesState.dart';


class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<RolesBloc, RolesState>(builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              children: state.roles != null
                  ? (state.roles?.map((Roles? role) {
                return role != null ? RolesItem(role) : Container();
              }).toList()) as List<Widget>
                  : [],
            ),
          );
        }));
  }
}
