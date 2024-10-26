import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sppp/src/presentation/pages/admin/roles/create/bloc/RolesBloc.dart';
import 'package:sppp/src/presentation/pages/admin/roles/create/bloc/RolesEvent.dart';
import 'package:sppp/src/presentation/pages/admin/roles/create/bloc/RolesState.dart';

class RolesCreatePage extends StatelessWidget {
  const RolesCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RolesBloc(),
      child: RolesCreateForm(),
    );
  }
}

class RolesCreateForm extends StatefulWidget {
  @override
  _RolesCreateFormState createState() => _RolesCreateFormState();
}

class _RolesCreateFormState extends State<RolesCreateForm> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _imageController = TextEditingController();
  final _routeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RolesBloc, RolesState>(
      listener: (context, state) {
        if (state is RolesSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Rol creado con éxito')),
          );
          // Regresar a la pantalla anterior después de crear el rol
          Navigator.pop(context); // Añade esta línea
        } else if (state is RolesFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Crear Rol'),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          backgroundColor: Colors.blue[900], // Tono azul marino
          elevation: 4, // Sombra para darle un efecto elevado
          iconTheme:
              IconThemeData(color: Colors.white), // Cambiar color de la flecha
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(_idController, "ID", Icons.confirmation_number),
                SizedBox(height: 16),
                _buildTextField(_nameController, "Nombre", Icons.person),
                SizedBox(height: 16),
                _buildTextField(_imageController, "Imagen (URL)", Icons.image),
                SizedBox(height: 16),
                _buildTextField(_routeController, "Ruta", Icons.route),
                SizedBox(height: 24),
                BlocBuilder<RolesBloc, RolesState>(builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is RolesLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<RolesBloc>(context).add(
                                CreateRole(
                                  id: _idController.text,
                                  name: _nameController.text,
                                  image: _imageController.text,
                                  route: _routeController.text,
                                ),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue[900], // Cambiado a backgroundColor
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                    child: state is RolesLoading
                        ? CircularProgressIndicator(color: Colors.black)
                        : Text(
                            "Crear Rol",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(icon, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: (value) => value!.isEmpty ? 'Este campo es requerido' : null,
    );
  }
}
