import 'package:flutter/material.dart';

class RegisterPracticePage extends StatefulWidget {
  @override
  _RegisterPracticePageState createState() => _RegisterPracticePageState();
}

class _RegisterPracticePageState extends State<RegisterPracticePage> {
  TextEditingController fechaController = TextEditingController();
  TextEditingController fechaInicioController = TextEditingController();
  TextEditingController fechaFinController = TextEditingController();

  Future<void> _selectDateTime(
      BuildContext context, TextEditingController controller) async {
    // Seleccionar Fecha
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      // Seleccionar Hora
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          // Combinar Fecha y Hora seleccionadas
          final dateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          controller.text =
              "${dateTime.day}/${dateTime.month}/${dateTime.year} ${pickedTime.format(context)}";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/logininicial.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Degradado lineal superpuesto a la imagen
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                  const Color.fromARGB(255, 255, 254, 255).withOpacity(0.6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Contenido principal
          SafeArea(
            child: Column(
              children: [
                // Botón de regreso
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.purple),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.blue, width: 1.5),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Registro de Prácticas',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 20),
                            _buildTextField('Código del Estudiante'),
                            SizedBox(height: 10),
                            _buildTextField('Empresa'),
                            SizedBox(height: 10),
                            _buildTextField('Supervisor'),
                            SizedBox(height: 10),
                            _buildDateTimeField(
                                'Fecha de Inicio', fechaInicioController),
                            SizedBox(height: 10),
                            _buildDateTimeField(
                                'Fecha de Fin (opcional)', fechaFinController),
                            SizedBox(height: 10),
                            _buildTextField('Estado'),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // Acción del botón Asignar prácticas
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.amber, // Color amarillo del botón
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 12),
                              ),
                              child: Text(
                                'Asignar prácticas',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        labelText: label,
        labelStyle: TextStyle(color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildDateTimeField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () => _selectDateTime(context, controller),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        labelText: label,
        labelStyle: TextStyle(color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(Icons.calendar_today, color: Colors.blue),
      ),
    );
  }
}
