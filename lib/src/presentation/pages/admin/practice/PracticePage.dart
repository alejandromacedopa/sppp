import 'package:flutter/material.dart';

class PracticePage extends StatelessWidget {
  final List<Map<String, String>> practices = [
    {
      'empresa': 'Inmobilario Andes',
      'supervisor': 'Leoncio Algarate',
      'fechaInicio': '01/10/2024',
      'fechaFin': '22/12/2024',
      'estado': 'Activo',
    },
    {
      'empresa': 'Vulcanizadora Morales',
      'supervisor': 'Andres Lopez',
      'fechaInicio': '01/02/2024',
      'fechaFin': '18/10/2024',
      'estado': 'Finalizado',
    },
  ];

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
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Mis Prácticas',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: practices.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 3.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildPracticeDetail(
                                            'Empresa',
                                            practices[index]['empresa']!,
                                          ),
                                          SizedBox(height: 4),
                                          _buildPracticeDetail(
                                            'Supervisor',
                                            practices[index]['supervisor']!,
                                          ),
                                          SizedBox(height: 8),
                                          Divider(color: Colors.grey.shade300),
                                          SizedBox(height: 8),
                                          _buildPracticeDetail(
                                            'Fecha de Inicio',
                                            practices[index]['fechaInicio']!,
                                          ),
                                          SizedBox(height: 4),
                                          _buildPracticeDetail(
                                            'Fecha de Fin',
                                            practices[index]['fechaFin']!,
                                          ),
                                          SizedBox(height: 8),
                                          _buildPracticeDetail(
                                            'Estado',
                                            practices[index]['estado']!,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
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

  Widget _buildPracticeDetail(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontSize: 14.0,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black54,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
