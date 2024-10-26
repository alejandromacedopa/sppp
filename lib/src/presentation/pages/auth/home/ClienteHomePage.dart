import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/main.dart';
import 'package:sppp/src/presentation/pages/auth/client/category/list/ClientCategoryListPage.dart';
import 'package:sppp/src/presentation/pages/auth/home/bloc/ClientHomeBloc.dart';
import 'package:sppp/src/presentation/pages/auth/home/bloc/ClientHomeEvent.dart';
import 'package:sppp/src/presentation/pages/auth/home/bloc/ClientHomeState.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  ClientHomeBloc? _bloc;

  List<Widget> pageList = <Widget>[ClientCategoryListPage()];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientHomeBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.green,
        ),
        drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
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
                  title: Text('Categorias'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    _bloc?.add(ClientChangeDrawerPage(pageIndex: 0));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  iconColor: Colors.green,
                  title: Text('Roles'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    Navigator.pushNamed(context, 'admin/home');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  iconColor: Colors.green,
                  title: Text('Cerrar Sesion'),
                  onTap: () {
                    _bloc?.add(ClientLogout());
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
        body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
            builder: (context, state) {
          return pageList[state.pageIndex];
        }));
  }
}
