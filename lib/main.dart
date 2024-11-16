import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/Injection.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/AdminEnterpriseCreatePage.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/AdminEnterpriseListPage.dart';
import 'package:sppp/src/presentation/pages/admin/home/AdminHomePage.dart';
import 'package:sppp/src/presentation/pages/admin/practice/PracticePage.dart';
import 'package:sppp/src/presentation/pages/admin/registerpractice/RegisterPracticePage.dart';
import 'package:sppp/src/presentation/pages/auth/login/LoginInitial.dart';
import 'package:sppp/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:sppp/src/presentation/pages/auth/menu/actividad/ActividadContent.dart';
import 'package:sppp/src/presentation/pages/auth/menu/actividad/formulario/FormularioActividadContent.dart';
import 'package:sppp/src/presentation/pages/auth/menu/actividad/gestionar/GestionarActividadContent.dart';
import 'package:sppp/src/presentation/pages/auth/menu/empresa/EmpresaContent.dart';
import 'package:sppp/src/presentation/pages/auth/roles/RolesPage.dart';
import 'package:sppp/src/presentation/pages/blocProviders.dart';
import 'package:sppp/src/presentation/pages/student/home/StudentHomePage.dart';

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
              'login': (BuildContext context) => LoginInitial(),
              'login/screen': (BuildContext context) => LoginPage(),
              'roles': (BuildContext context) => RolesPage(),
              //STUDENT
              'student/home': (BuildContext context) => StudentHomePage(),
              //ADMIN
              'admin/home': (BuildContext context) => AdminHomePage(),
              'admin/enterprise/list': (BuildContext context) => AdminEnterpriseListPage(),
              'admin/enterprise/create': (BuildContext context) => AdminEnterpriseCreatePage(),

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
