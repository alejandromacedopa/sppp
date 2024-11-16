import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/Injection.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/domain/useCases/enterprise/EnterpriseUseCases.dart';
import 'package:sppp/src/domain/useCases/roles/RolesUseCases.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/bloc/AdminEnterpriseUpdateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/bloc/AdminRolesListBloc.dart';
import 'package:sppp/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:sppp/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:sppp/src/presentation/pages/auth/roles/bloc/RolesBloc.dart';
import 'package:sppp/src/presentation/pages/auth/roles/bloc/RolesEvent.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeBloc.dart';

List<BlocProvider> blocProviders = [
  //AUTH
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(locator<AuthUseCases>())..add(InitEvent())),

  BlocProvider<RolesBloc>(
      create: (context) =>
      RolesBloc(locator<AuthUseCases>())..add(GetRolesList())),
  //ADMIN PROVIDERS
  BlocProvider<AdminHomeBloc>(create: (context) => AdminHomeBloc()),
  BlocProvider<AdminRolesListBloc>(
      create: (context) => AdminRolesListBloc(locator<RolesUseCases>())),

  BlocProvider<AdminEnterpriseListBloc>(
      create: (context) => AdminEnterpriseListBloc(locator<EnterpriseUseCases>())),
  BlocProvider<AdminEnterpriseCreateBloc>(
      create: (context) => AdminEnterpriseCreateBloc(locator<EnterpriseUseCases>())
        ..add(AdminEnterpriseCreateInitEvent())),
  BlocProvider<AdminEnterpriseUpdateBloc>(
      create: (context) =>
          AdminEnterpriseUpdateBloc(locator<EnterpriseUseCases>())),



  //STUDENT PROVIDERS
  BlocProvider<StudentHomeBloc>(
      create: (context) => StudentHomeBloc(locator<AuthUseCases>())),

];
