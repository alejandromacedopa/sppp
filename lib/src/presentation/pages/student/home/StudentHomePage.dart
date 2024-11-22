import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/main.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/StudentShoppingBagPage.dart';
import 'package:sppp/src/presentation/pages/student/category/list/StudentCategoryListPage.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeBloc.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeEvent.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeState.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePage();
}

class _StudentHomePage extends State<StudentHomePage> with SingleTickerProviderStateMixin {
  late StudentHomeBloc _bloc;

  final List<Widget> pageList = <Widget>[
    StudentCategoryListPage(),
    StudentCategoryListPage(),
    StudentShoppingBagPage(),

    //RolesListPage(),
    //AdminUsersListPage(),
  ];

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<StudentHomeBloc>(context);
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
              colors: [Colors.blue.shade800, Colors.blue.shade600],
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
          'Panel Estudiante',
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
      ),
      body: BlocBuilder<StudentHomeBloc, StudentHomeState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: state.isLoading
                ? _buildLoadingIndicator() // Asegúrate de que el indicador de carga sea visible
                : pageList[state.pageIndex],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<StudentHomeBloc, StudentHomeState>(
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
                  _showLogoutDialog(); // Muestra el diálogo antes de cerrar sesión
                } else {
                  _bloc.add(StudentChangeDrawerPage(pageIndex: index));
                }
              },
              items: [
                _buildNavItem(Icons.business, 'Cursos', state.pageIndex == 0),
                _buildNavItem(Icons.person_4, 'item2', state.pageIndex == 1),
                _buildNavItem(Icons.shopping_bag, 'Carrito', state.pageIndex == 2),
                _buildNavItem(Icons.category, 'item4', state.pageIndex == 3),
                _buildNavItem(Icons.logout, 'Cerrar Sesión', state.pageIndex == 4, color: Colors.redAccent),
              ],
              selectedItemColor: Colors.blue.shade700,
              unselectedItemColor: Colors.grey.shade400,
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

  // Método para mostrar el diálogo de confirmación de cierre de sesión
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade800, Colors.blue.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 12,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 6,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(18),
                    child: Icon(
                      Icons.exit_to_app,
                      size: 50,
                      color: Colors.amber.shade700,
                    ),
                  ),
                  const Text(
                    '¿Estás seguro de cerrar sesión?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Al cerrar sesión perderás el acceso a la aplicación hasta que inicies sesión nuevamente.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          side: BorderSide(color: Colors.blue.shade800),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Cierra el diálogo sin hacer nada
                        },
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade700,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        onPressed: () {
                          _bloc.add(StudentLogout());
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                                (route) => false,
                          );
                        },
                        child: const Text(
                          'Cerrar Sesión',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Método para el indicador de carga mejorado
  Widget _buildLoadingIndicator() {
    return Center(
      child: AnimatedScale(
        scale: 1.1,
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircularProgressIndicator(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber.shade700),
            ),
          ),
        ),
      ),
    );
  }
}
