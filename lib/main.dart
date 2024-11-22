import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/Injection.dart';
import 'package:sppp/src/presentation/pages/admin/category/create/AdminCategoryCreatePage.dart';
import 'package:sppp/src/presentation/pages/admin/category/list/AdminCategoryListPage.dart';
import 'package:sppp/src/presentation/pages/admin/category/update/AdminCategoryUpdatePage.dart';
import 'package:sppp/src/presentation/pages/admin/courses/create/AdminCoursesCreatePage.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/AdminCoursesListPage.dart';
import 'package:sppp/src/presentation/pages/admin/courses/update/AdminCoursesUpdatePage.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/AdminEnterpriseCreatePage.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/AdminEnterpriseListPage.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/AdminEnterpriseUpdatePage.dart';
import 'package:sppp/src/presentation/pages/admin/home/AdminHomePage.dart';
import 'package:sppp/src/presentation/pages/admin/practice/PracticePage.dart';
import 'package:sppp/src/presentation/pages/admin/registerpractice/RegisterPracticePage.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/RolesListPage.dart';
import 'package:sppp/src/presentation/pages/admin/users/list/AdminUsersListPage.dart';
import 'package:sppp/src/presentation/pages/auth/login/LoginInitial.dart';
import 'package:sppp/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:sppp/src/presentation/pages/auth/menu/actividad/ActividadContent.dart';
import 'package:sppp/src/presentation/pages/auth/menu/actividad/formulario/FormularioActividadContent.dart';
import 'package:sppp/src/presentation/pages/auth/menu/actividad/gestionar/GestionarActividadContent.dart';
import 'package:sppp/src/presentation/pages/auth/menu/empresa/EmpresaContent.dart';
import 'package:sppp/src/presentation/pages/auth/roles/RolesPage.dart';
import 'package:sppp/src/presentation/pages/blocProviders.dart';
import 'package:sppp/src/presentation/pages/student/address/create/StudentAddressCreatePage.dart';
import 'package:sppp/src/presentation/pages/student/address/list/StudentAddressListPage.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/StudentCoursesDetailPage.dart';
import 'package:sppp/src/presentation/pages/student/coruses/list/StudentCoursesListPage.dart';
import 'package:sppp/src/presentation/pages/student/home/StudentHomePage.dart';
import 'package:sppp/src/presentation/pages/student/payment/form/StudentPaymentFormPage.dart';
import 'package:sppp/src/presentation/pages/student/payment/installments/StudentPaymentInstallmentsPage.dart';
import 'package:sppp/src/presentation/pages/student/payment/status/ClientPaymentStatusPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencias();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: blocProviders,
        child: MaterialApp(
            builder: FToastBuilder(),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              useMaterial3: true,
            ),
            initialRoute: 'login',
            routes: {
              //AUTH
             // 'initial': (BuildContext context) => SplashScreen(),
              'login': (BuildContext context) => LoginPage(),
              'roles': (BuildContext context) => RolesPage(),
              //STUDENT
              'student/home': (BuildContext context) => StudentHomePage(),
              //COURSES
              'student/courses/list': (BuildContext context) => StudentCoursesListPage(),
              'student/courses/detail': (BuildContext context) =>
                  StudentCoursesDetailPage(),

              //ADDRESS
              'student/address/list': (BuildContext context) =>
                  StudentAddressListPage(),
              'student/address/create': (BuildContext context) =>
                  StudentAddressCreatePage(),

              //PAYMENTS
              'student/payment/form': (BuildContext context) =>
                  StudentPaymentFormPage(),
              'student/payment/installments': (BuildContext context) =>
                  StudentPaymentInstallmentsPage(),
              'student/payment/status': (BuildContext context) =>
                  StudentPaymentStatusPage(),
              //ADMIN
              'admin/home': (BuildContext context) => AdminHomePage(),
              'admin/users/view': (BuildContext context) => AdminUsersListPage(),
              'admin/roles/view': (BuildContext context) => RolesListPage(),
              //ENTERPRISES
              'admin/enterprise/list': (BuildContext context) => AdminEnterpriseListPage(),
              'admin/enterprise/create': (BuildContext context) => AdminEnterpriseCreatePage(),
              'admin/enterprise/update': (BuildContext context) => AdminEnterpriseUpdatePage(),
              //CATEGORY
              'admin/category/create': (BuildContext context) => AdminCategoryCreatePage(),
              'admin/category/update': (BuildContext context) => AdminCategoryUpdatePage(),
              //COURSES
              'admin/courses/list': (BuildContext context) => AdminCoursesListPage(),
              'admin/courses/create': (BuildContext context) => AdminCoursesCreatePage(),
              'admin/courses/update': (BuildContext context) => AdminCoursesUpdatePage(),

              'admin/practicas': (BuildContext context) =>
                  RegisterPracticePage(),
              'admin/viewpracticas': (BuildContext context) => PracticePage(),
              'empresa': (BuildContext context) => EmpresaSelectionScreen(),
              'empresa/actividad': (BuildContext context) => ActividadContent(),
              'empresa/actividad/gestionar': (BuildContext context) =>
                  GestionarActividadContent(),
              'empresa/actividad/agregar': (BuildContext context) =>
                  FormularioActividadContent()
            }));
  }
}
