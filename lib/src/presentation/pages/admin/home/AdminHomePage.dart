import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/main.dart';
import 'package:sppp/src/presentation/pages/admin/category/list/AdminCategoryListPage.dart';
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

class _AdminHomePageState extends State<AdminHomePage> with SingleTickerProviderStateMixin {
  late AdminHomeBloc _bloc;

  final List<Widget> pageList = <Widget>[
    AdminEnterpriseListPage(),
    RolesListPage(),
    AdminUsersListPage(),
    AdminCategoryListPage(),
  ];

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AdminHomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey.shade900.withOpacity(0.8), Colors.blueGrey.shade500.withOpacity(0.8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
        ),
        title: const Text(
          'Panel Administrativo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 4,
                color: Colors.black26,
                offset: Offset(1, 2),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 28, color: Colors.white),
            onPressed: () {
              // Acción para el perfil
            },
            splashRadius: 24,
            tooltip: "Perfil",
          ),
        ],
      ),
      body: BlocBuilder<AdminHomeBloc, AdminHomeState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: state.isLoading
                ? const Center(
              key: ValueKey('loading'),
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            )
                : pageList[state.pageIndex],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<AdminHomeBloc, AdminHomeState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: state.pageIndex,
              onTap: (index) {
                if (index == 4) {
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
              items: [
                _buildNavItem(Icons.business, 'Empresas', state.pageIndex == 0),
                _buildNavItem(Icons.person_4, 'Roles', state.pageIndex == 1),
                _buildNavItem(Icons.people, 'Usuarios', state.pageIndex == 2),
                _buildNavItem(Icons.category, 'Cursos', state.pageIndex == 3),
                _buildNavItem(Icons.logout, 'Cerrar Sesión', state.pageIndex == 4, color: Colors.redAccent),
              ],
              selectedItemColor: Colors.blue,
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

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, bool isSelected, {Color? color}) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: isSelected ? const EdgeInsets.all(6) : EdgeInsets.zero,
        decoration: isSelected
            ? BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.withOpacity(0.5), Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          shape: BoxShape.circle,
        )
            : null,
        child: Icon(
          icon,
          size: isSelected ? 32 : 28,
          color: isSelected ? (color ?? Colors.black) : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}
