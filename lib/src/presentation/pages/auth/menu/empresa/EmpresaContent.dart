import 'package:flutter/material.dart';

class EmpresaSelectionScreen extends StatefulWidget {
  @override
  _EmpresaSelectionScreenState createState() => _EmpresaSelectionScreenState();
}

class _EmpresaSelectionScreenState extends State<EmpresaSelectionScreen> {
  String? selectedEmpresa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003366), // Fondo azul oscuro
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.business_center,
              size: 80,
              color: Colors.amber, // Icono amarillo
            ),
            SizedBox(height: 20),
            Text(
              'Selecciona tu empresa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            // Botones de empresa
            EmpresaButton(
              text: 'Manguitos SAC',
              isSelected: selectedEmpresa == 'Manguitos SAC',
              onPressed: () {
                setState(() {
                  selectedEmpresa = 'Manguitos SAC';
                });
              },
            ),
            SizedBox(height: 15),
            EmpresaButton(
              text: 'SORSA',
              isSelected: selectedEmpresa == 'SORSA',
              onPressed: () {
                setState(() {
                  selectedEmpresa = 'SORSA';
                });
              },
            ),
            SizedBox(height: 15),
            EmpresaButton(
              text: 'Municipalidad de Morales',
              isSelected: selectedEmpresa == 'Municipalidad de Morales',
              onPressed: () {
                setState(() {
                  selectedEmpresa = 'Municipalidad de Morales';
                });
              },
            ),
            SizedBox(height: 30),
            // Botón de continuar
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // Fondo amarillo
                foregroundColor: Colors.white, // Color del texto
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: selectedEmpresa != null
                  ? () {
                      // Navegar a la nueva vista si se seleccionó una empresa
                      Navigator.popAndPushNamed(context, 'empresa/actividad');
                    }
                  : null,
              child: Text(
                'Continuar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmpresaButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const EmpresaButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.amber : Colors.white, // Fondo
        foregroundColor:
            isSelected ? Colors.white : Colors.black, // Color del texto
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
