import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/main.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/AdminEnterpriseListPage.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/RolesListPage.dart';
import 'package:sppp/src/presentation/pages/admin/users/list/AdminUsersListPage.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late AdminHomeBloc _bloc;

  final List<Widget> pageList = <Widget>[
    AdminEnterpriseListPage(),
    RolesListPage(),
    AdminUsersListPage()
  ];

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AdminHomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Panel Administrativo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
        elevation: 10,
        shadowColor: Colors.black54,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 30),
            onPressed: () {
              // Aquí puedes agregar la acción para abrir la página de perfil
            },
          ),
        ],
      ),
      body: BlocBuilder<AdminHomeBloc, AdminHomeState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: state.isLoading
                ? const Center(
              key: ValueKey('loading'),
              child: CircularProgressIndicator(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            )
                : pageList[state.pageIndex],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<AdminHomeBloc, AdminHomeState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: state.pageIndex,
              onTap: (index) {
                if (index == 3) {
                  _bloc.add(AdminLogout());
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                        (route) => false,
                  );
                } else {
                  _bloc.add(AdminChangeDrawerPage(pageIndex: index));
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.business, size: 28),
                  label: 'Empresas',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_4, size: 28),
                  label: 'Roles',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.people, size: 28),
                  label: 'Usuarios',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.logout, size: 28),
                  label: 'Cerrar Sesión',
                ),

              ],
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 12,
              ),
            ),
          );
        },
      ),
    );
  }
}
