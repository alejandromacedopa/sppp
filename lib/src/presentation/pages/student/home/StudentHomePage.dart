import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/main.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/StudentShoppingBagPage.dart';
import 'package:sppp/src/presentation/pages/student/category/list/StudentCategoryListPage.dart';
import 'package:sppp/src/presentation/pages/student/evidences/list/AdminEvidenceListPage.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeBloc.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeEvent.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeState.dart';
import 'package:sppp/src/presentation/pages/student/orders/list/StudentOrdersListPage.dart';
import 'package:sppp/src/presentation/pages/student/profile/ProfileInfoPage.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePage();
}

class _StudentHomePage extends State<StudentHomePage> with SingleTickerProviderStateMixin {
  late StudentHomeBloc _bloc;
  late AnimationController _lineAnimationController;
  late Animation<double> _lineAnimation;

  final List<Widget> pageList = <Widget>[
    //AdminEvidenceListPage(),
    StudentCategoryListPage(),
    StudentOrdersListPage(),
    StudentShoppingBagPage(),
    ProfileInfoPage(),

  ];

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<StudentHomeBloc>(context);

    // Animation Controller for the moving line
    _lineAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true); // Repeats the animation in a loop
    _lineAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _lineAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _lineAnimationController.dispose();
    super.dispose();
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
              colors: [Colors.deepPurple.shade900, Colors.blueAccent.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                spreadRadius: 5,
              ),
            ],
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícono con animación de rotación
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(seconds: 2),
              curve: Curves.elasticOut,
              builder: (context, value, child) {
                return Transform.rotate(
                  angle: value * 3.14 / 4, // Rota 45 grados
                  child: Icon(
                    Icons.waving_hand,
                    color: Colors.amber.shade500,
                    size: 36,
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            // Título animado con opacidad y deslizamiento
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Text(
                '¡Hola de nuevo!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [Colors.amber.shade300, Colors.orange.shade600],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                  shadows: [
                    Shadow(
                      blurRadius: 6,
                      color: Colors.black38,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Column(
            children: [
              // Línea decorativa que se mueve
              AnimatedBuilder(
                animation: _lineAnimationController,
                builder: (context, child) {
                  return Container(
                    width: MediaQuery.of(context).size.width * _lineAnimation.value,
                    height: 2,
                    color: Colors.amber.shade600,
                  );
                },
              ),
              const SizedBox(height: 8),
              // Subtítulo animado
              AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                child: Text(
                  'Estamos felices de verte aquí 😊',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
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
                _buildNavItem(Icons.category, 'Cursos', state.pageIndex == 0),
                _buildNavItem(Icons.shopping_cart_checkout, 'Compras', state.pageIndex == 1),
                _buildNavItem(Icons.shopping_bag, 'Carrito', state.pageIndex == 2),
                _buildNavItem(Icons.edit, 'Perfil', state.pageIndex == 3),
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

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.amber.shade500,
      ),
    );
  }
}
