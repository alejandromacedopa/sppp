import 'package:flutter/material.dart';
import 'package:sppp/src/presentation/pages/auth/client/home/login/LoginPage.dart';

//vista cliente contenido
class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido de nuevo'),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        backgroundColor: Colors.blue[900],
        iconTheme: IconThemeData(
          color: Colors
              .white, // Change the color of the three-bar icon (hamburger icon)
        ), // Tono azul marino
        elevation: 4, // Sombra para darle un efecto elevado
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue[800], // Fondo del Drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue[900], // Tono azul marino
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/img/woman.jpg'),
                      radius: 40,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Menu de opciones',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              _buildDrawerItem(
                icon: Icons.home,
                text: 'Inicio',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              _buildDrawerItem(
                icon: Icons.supervised_user_circle,
                text: 'Roles',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'admin/home', (route) => false);
                },
              ),
              _buildDrawerItem(
                icon: Icons.list,
                text: 'Productos',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              _buildDrawerItem(
                icon: Icons.logout,
                text: 'Salir',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
      tileColor: Colors.blue[700], // Color más claro para el item
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}
