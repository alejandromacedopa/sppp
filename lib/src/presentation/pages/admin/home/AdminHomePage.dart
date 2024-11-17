import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/main.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/AdminEnterpriseListPage.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:sppp/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  AdminHomeBloc? _bloc;

  List<Widget> pageList = <Widget>[
    AdminEnterpriseListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminHomeBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.blue,
        ),
        drawer: BlocBuilder<AdminHomeBloc, AdminHomeState>(
            builder: (context, state) {
              return Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/img/woman.jpg'),
                              fit: BoxFit.cover)),
                      child: Text(
                        'Menu de opciones',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      iconColor: Colors.green,
                      title: Text('Empresas'),
                      selected: state.pageIndex == 0,
                      onTap: () {
                        _bloc?.add(AdminChangeDrawerPage(pageIndex: 0));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      iconColor: Colors.green,
                      title: Text('Cerrar Sesion'),
                      onTap: () {
                        _bloc?.add(AdminLogout());
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                                (route) => false);
                      },
                    ),
                  ],
                ),
              );
            }),
        body: BlocBuilder<AdminHomeBloc, AdminHomeState>(
            builder: (context, state) {
              return pageList[state.pageIndex];
            }));
  }
}