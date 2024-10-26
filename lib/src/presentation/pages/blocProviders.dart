import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/Injection.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/domain/useCases/roles/RolesUseCases.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/bloc/AdminRolesListBloc.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/bloc/LoginBloc.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/bloc/LoginEvent.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/register/bloc/RegisterBloc.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/register/bloc/RegisterEvent.dart';
import 'package:sppp/src/presentation/pages/auth/home/bloc/ClientHomeBloc.dart';
import 'package:sppp/src/presentation/pages/auth/list/bloc/AdminUserListBloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  BlocProvider<RegisterBloc>(
      create: (context) =>
          RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<AdminHomeBloc>(create: (context) => AdminHomeBloc()),
  BlocProvider<AdminRolesListBloc>(
      create: (context) => AdminRolesListBloc(locator<RolesUseCases>())),
  BlocProvider<AdminUserListBloc>(
      create: (context) => AdminUserListBloc(locator<AuthUseCases>())),
  BlocProvider<ClientHomeBloc>(
      create: (context) => ClientHomeBloc(locator<AuthUseCases>())),
];
