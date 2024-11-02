import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/Injection.dart';
import 'package:sppp/src/presentation/pages/admin/home/AdminHomePage.dart';
import 'package:sppp/src/presentation/pages/admin/home/AdminUserList.dart';
import 'package:sppp/src/presentation/pages/admin/practice/PracticePage.dart';
import 'package:sppp/src/presentation/pages/admin/registerpractice/RegisterPracticePage.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/LoginInitial.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/LoginPage.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/register/RegisterPage.dart';
import 'package:sppp/src/presentation/pages/auth/home/ClienteHomePage.dart';
import 'package:sppp/src/presentation/pages/blocProviders.dart';

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
              'login': (BuildContext context) => LoginInitial(),
              'login/screen': (BuildContext context) => LoginPage(),
              'register': (BuildContext context) => RegisterPage(),
              'client/home': (BuildContext context) => ClientHomePage(),
              'admin/home': (BuildContext context) => AdminHomePage(),
              'usuarios': (BuildContext context) => AdminUserList(),
              'admin/practicas': (BuildContext context) =>
                  RegisterPracticePage(),
              'admin/viewpracticas': (BuildContext context) => PracticePage()
            }));
  }
}
