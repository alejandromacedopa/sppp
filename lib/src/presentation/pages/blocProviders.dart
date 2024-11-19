import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/Injection.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/domain/useCases/category/CategoryUseCases.dart';
import 'package:sppp/src/domain/useCases/courses/CoursesUseCases.dart';
import 'package:sppp/src/domain/useCases/enterprise/EnterpriseUseCases.dart';
import 'package:sppp/src/domain/useCases/roles/RolesUseCases.dart';
import 'package:sppp/src/domain/useCases/users/UsersUseCases.dart';
import 'package:sppp/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/courses/create/bloc/AdminCoursesCreateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/courses/create/bloc/AdminCoursesCreateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/courses/update/bloc/AdminCoursesUpdateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/bloc/AdminEnterpriseUpdateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/bloc/AdminRolesListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/users/list/bloc/AdminUsersListBloc.dart';
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
  BlocProvider<AdminHomeBloc>(
      create: (context) => AdminHomeBloc(locator<AuthUseCases>())),
  BlocProvider<AdminRolesListBloc>(
      create: (context) => AdminRolesListBloc(locator<RolesUseCases>())),
  BlocProvider<AdminUsersListBloc>(
      create: (context) => AdminUsersListBloc(locator<UsersUseCases>())),
//CATEGORY
  BlocProvider<AdminCategoryListBloc>(
      create: (context) => AdminCategoryListBloc(locator<CategoriesUseCases>())),
  BlocProvider<AdminCategoryCreateBloc>(
      create: (context) => AdminCategoryCreateBloc(locator<CategoriesUseCases>())
        ..add(AdminCategoryCreateInitEvent())),
  BlocProvider<AdminCategoryUpdateBloc>(
      create: (context) =>
          AdminCategoryUpdateBloc(locator<CategoriesUseCases>())),
//COURSES
  BlocProvider<AdminCoursesListBloc>(
      create: (context) => AdminCoursesListBloc(locator<CoursesUseCases>())),
  BlocProvider<AdminCoursesCreateBloc>(
      create: (context) => AdminCoursesCreateBloc(locator<CoursesUseCases>())),
  BlocProvider<AdminCoursesUpdateBloc>(
      create: (context) =>
          AdminCoursesUpdateBloc(locator<CoursesUseCases>())),
  //ENTERPRISE
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
