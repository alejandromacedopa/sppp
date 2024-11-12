import 'package:flutter/material.dart';

class ActividadContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003366), // Fondo azul oscuro
      appBar: AppBar(
        backgroundColor: Color(0xFF003366),
        elevation: 0,
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () {
            Navigator.pushNamed(context, 'empresa');
          },
        ),*/
        title: Text(
          'Bienvenido Kodegod',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.amber, // Color ámbar similar al botón "Agregar"
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              ),
              child: Text(
                'Cerrar Sesión',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight
                        .bold), // Tamaño y negrita para mayor visibilidad
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              color: Color(0xFFFFF5F5), // Fondo blanco de la tarjeta
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading:
                    Icon(Icons.radio_button_unchecked, color: Colors.amber),
                title: Text(
                  'Base de datos',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Migrar MySQL a Excel'),
                trailing: Icon(Icons.edit, color: Colors.amber),
                onTap: () {
                  Navigator.popAndPushNamed(
                      context, 'empresa/actividad/gestionar');
                },
              ),
            ),
            Card(
              color: Color(0xFFFFF5F5), // Fondo blanco de la tarjeta
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading:
                    Icon(Icons.radio_button_unchecked, color: Colors.amber),
                title: Text(
                  'Conectar a la misma red a las impresoras',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'Solucionar problemas de conexion a la misma red a las impresora'),
                trailing: Icon(Icons.edit, color: Colors.amber),
                onTap: () {
                  Navigator.popAndPushNamed(
                      context, 'empresa/actividad/gestionar');
                },
              ),
            ),
            Card(
              color: Color(0xFFFFF5F5), // Fondo blanco de la tarjeta
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading:
                    Icon(Icons.radio_button_unchecked, color: Colors.amber),
                title: Text(
                  'Activar Licencias Autodesk, Office',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle:
                    Text('Crackear programas como, autocad, revit, excel 2025'),
                trailing: Icon(Icons.edit, color: Colors.amber),
                onTap: () {
                  Navigator.popAndPushNamed(
                      context, 'empresa/actividad/gestionar');
                },
              ),
            ),
            Spacer(), // Espacio para empujar el botón hacia abajo
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.amber,
                onPressed: () {
                  Navigator.popAndPushNamed(
                      context, 'empresa/actividad/agregar');
                },
                label: Text('Agregar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
