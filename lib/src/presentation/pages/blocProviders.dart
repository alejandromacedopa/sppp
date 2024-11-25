import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/Injection.dart';
import 'package:sppp/src/domain/useCases/MercadoPago/MercadoPagoUseCases.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:sppp/src/domain/useCases/address/AddressUseCases.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/domain/useCases/category/CategoryUseCases.dart';
import 'package:sppp/src/domain/useCases/courses/CoursesUseCases.dart';
import 'package:sppp/src/domain/useCases/enterprise/EnterpriseUseCases.dart';
import 'package:sppp/src/domain/useCases/evidences/EvidenceUseCases.dart';
import 'package:sppp/src/domain/useCases/orders/OrdersUseCases.dart';
import 'package:sppp/src/domain/useCases/roles/RolesUseCases.dart';
import 'package:sppp/src/domain/useCases/users/UsersUseCases.dart';
import 'package:sppp/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/courses/create/bloc/AdminCoursesCreateBloc.dart';
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
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagBloc.dart';
import 'package:sppp/src/presentation/pages/student/address/create/bloc/StudentAddressCreateBloc.dart';
import 'package:sppp/src/presentation/pages/student/address/create/bloc/StudentAddressCreateEvent.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListBloc.dart';
import 'package:sppp/src/presentation/pages/student/category/list/bloc/StudentCategoryListBloc.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailBloc.dart';
import 'package:sppp/src/presentation/pages/student/coruses/list/bloc/StudentCoursesListBloc.dart';
import 'package:sppp/src/presentation/pages/student/evidences/create/bloc/AdminEvidenceCreateBloc.dart';
import 'package:sppp/src/presentation/pages/student/evidences/list/bloc/AdminEvidenceListBloc.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeBloc.dart';
import 'package:sppp/src/presentation/pages/student/orders/list/bloc/StudentOrdersListBloc.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/bloc/StudentPaymentFormBloc.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/bloc/StudentPaymentFormEvent.dart';
import 'package:sppp/src/presentation/pages/student/payment/installments/bloc/StudentPaymentInstallmentsBloc.dart';
import 'package:sppp/src/presentation/pages/student/profile/bloc/ProfileInfoBloc.dart';
import 'package:sppp/src/presentation/pages/student/profile/bloc/ProfileInfoEvent.dart';

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

  //CATEGORY
  BlocProvider<StudentCategoryListBloc>(
      create: (context) => StudentCategoryListBloc(locator<CategoriesUseCases>())),

  //PROFILE
  BlocProvider<ProfileInfoBloc>(
      create: (context) =>
      ProfileInfoBloc(locator<AuthUseCases>())..add(ProfileInfoGetUser())),

  //COURSES
  BlocProvider<StudentCoursesListBloc>(
      create: (context) => StudentCoursesListBloc(locator<CoursesUseCases>())),
  BlocProvider<StudentCoursesDetailBloc>(
      create: (context) =>
          StudentCoursesDetailBloc(locator<ShoppingBagUseCases>())),

  //SHOPPING BAG
  BlocProvider<StudentShoppingBagBloc>(
      create: (context) =>
          StudentShoppingBagBloc(locator<ShoppingBagUseCases>())),

  //ADDRESS
  BlocProvider<StudentAddressCreateBloc>(
      create: (context) => StudentAddressCreateBloc(
          locator<AddressUseCases>(), locator<AuthUseCases>())
        ..add(StudentAddressCreateInitEvent())),
  BlocProvider<StudentAddressListBloc>(
      create: (context) => StudentAddressListBloc(
          locator<AddressUseCases>(), locator<AuthUseCases>())),
//evidence
// EVIDENCES
  BlocProvider<AdminEvidenceCreateBloc>(
    create: (context) => AdminEvidenceCreateBloc(locator<EvidenceUseCases>()),
  ),
  BlocProvider<AdminEvidenceListBloc>(
    create: (context) => AdminEvidenceListBloc(locator<EvidenceUseCases>()),
  ),


  //order

  BlocProvider<StudentOrdersListBloc>(
      create: (context) => StudentOrdersListBloc(
          locator<OrdersUseCases>(), locator<AuthUseCases>())),
  //PAYMENTS
  BlocProvider<StudentPaymentFormBloc>(
      create: (context) => StudentPaymentFormBloc(
          locator<MercadoPagoUseCases>(), locator<ShoppingBagUseCases>())
        ..add(StudentPaymentFormInitEvent())),
  BlocProvider<StudentPaymentInstallmentsBloc>(
      create: (context) => StudentPaymentInstallmentsBloc(
        locator<MercadoPagoUseCases>(),
        locator<AuthUseCases>(),
        locator<ShoppingBagUseCases>(),
        locator<AddressUseCases>(),
      )),
];
