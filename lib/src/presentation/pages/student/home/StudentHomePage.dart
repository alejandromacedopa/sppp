import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/main.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeBloc.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeEvent.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeState.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  StudentHomeBloc? _bloc;

  List<Widget> pageList = <Widget>[
    // Asegúrate de agregar la página que deseas mostrar en este índice
    // Ejemplo: StudentMotelsListPage(),
    // Si aún no tienes una página para mostrar, puedes usar un contenedor vacío o similar.
    Container() // Coloca una página válida o Widget aquí
  ];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<StudentHomeBloc>(context);
    return Scaffold(
      // AppBar con un diseño más atractivo
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            text: 'Bienvenido Practicante',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.2,
                color: Colors.white),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        elevation: 10,
        shadowColor: Colors.greenAccent.shade100,
      ),
      // Drawer con diseño mejorado
      drawer: BlocBuilder<StudentHomeBloc, StudentHomeState>(
        builder: (context, state) {
          return Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    image: DecorationImage(
                      image: AssetImage('assets/img/upeu1.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      SizedBox(height: 10),
                      Text(
                        'Menu',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      /*Text(
                        'cliente@hotel.com',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),*/
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.local_activity, color: Colors.green.shade700),
                  title: Text('Mis Actividades',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    _bloc?.add(StudentChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.timer, color: Colors.green.shade700),
                  title: Text('Ver mis horas',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    _bloc?.add(StudentChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.edit_note, color: Colors.green.shade700),
                  title: Text('Editar Perfil',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    _bloc?.add(StudentChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ),
                Divider(
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                    color: Colors.grey.shade300),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Cerrar Sesión',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  onTap: () {
                    _bloc?.add(StudentLogout());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                          (route) => false,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      // Cuerpo de la página con animación
      body: BlocBuilder<StudentHomeBloc, StudentHomeState>(
        builder: (context, state) {
          // Verifica que pageIndex esté dentro del rango de pageList
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 100),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: state.pageIndex < pageList.length
                ? pageList[state.pageIndex]
                : Container(), // Si pageIndex está fuera de rango, muestra un contenedor vacío
          );
        },
      ),
    );
  }
}
