import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/User.dart';

class ProfileInfoContent extends StatelessWidget {
  User? user;

  ProfileInfoContent(this.user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _gradientBackground(), // Fondo degradado azul marino a blanco
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Centrado horizontal
          children: [
            _imageProfile(),
            SizedBox(height: 20), // Espaciado entre la imagen y el card
            _cardProfileInfo(context),
          ],
        ),
      ],
    );
  }

  Widget _gradientBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo, Colors.white], // Degradado azul marino a blanco
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _cardProfileInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: MediaQuery.of(context).size.width * 0.85, // Ancho más ajustado
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Opacidad ligeramente baja
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              '${user?.name ?? ''} ${user?.lastname ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22), // Título más grande y en negrita
            ),
            subtitle: Text('Nombre de usuario', style: TextStyle(color: Colors.grey[600])),
            leading: Icon(Icons.person, color: Colors.indigo),
          ),
          ListTile(
            title: Text(
              user?.email ?? '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Texto más grande y negrita
            ),
            subtitle: Text('Correo electrónico', style: TextStyle(color: Colors.grey[600])),
            leading: Icon(Icons.email, color: Colors.indigo),
          ),
          ListTile(
            title: Text(
              user?.phone ?? '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Texto más grande y negrita
            ),
            subtitle: Text('Teléfono', style: TextStyle(color: Colors.grey[600])),
            leading: Icon(Icons.phone, color: Colors.indigo),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: FloatingActionButton(
              backgroundColor: Colors.indigo, // Botón de color azul marino
              onPressed: () {
                Navigator.pushNamed(context, 'profile/update', arguments: user);
              },
              child: Icon(Icons.edit, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageProfile() {
    return Container(
      margin: EdgeInsets.only(top: 40), // Mejora el espaciado con el encabezado
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4), // Borde más grueso
        image: user != null
            ? DecorationImage(
          image: NetworkImage(user!.image!),
          fit: BoxFit.cover,
        )
            : null,
      ),
    );
  }
}
