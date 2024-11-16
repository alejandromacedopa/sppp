import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Roles.dart';

class RolesItem extends StatelessWidget {
  final Roles role;
  RolesItem(this.role);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, role.route, (route) => false);
      },
      child: AnimatedOpacity(
        opacity: 0.95, // Leve opacidad para que destaque más al pasar el cursor
        duration: Duration(milliseconds: 250),
        child: Card(
          elevation: 12, // Elevación más pronunciada para resaltar el `Card`
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shadowColor: Colors.black.withOpacity(0.25),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Stack(
                  children: [
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.8), // Borde claro alrededor de la imagen
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 4), // Sombra interna para resaltar la imagen
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: FadeInImage(
                        image: NetworkImage(role.image),
                        fit: BoxFit.cover,
                        fadeInDuration: Duration(milliseconds: 800),
                        placeholder: AssetImage('assets/img/upeu1.png'),

                      ),

                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.4), // Efecto de brillo
                              Colors.transparent
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  role.name,
                  style: TextStyle(
                    fontSize: 22, // Tamaño de texto ligeramente más grande
                    color: Colors.grey.shade800, // Texto en gris oscuro para mayor elegancia
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
