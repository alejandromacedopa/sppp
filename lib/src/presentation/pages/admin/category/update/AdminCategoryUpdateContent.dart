import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';
import 'package:sppp/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:sppp/src/presentation/widget/DefaultIconBack.dart';
import 'package:sppp/src/presentation/widget/DefaultTextField.dart';

class AdminCategoryUpdateContent extends StatefulWidget {
  final AdminCategoryUpdateBloc? bloc;
  final AdminCategoryUpdateState state;
  final Category? category;

  const AdminCategoryUpdateContent(this.bloc, this.state, this.category, {Key? key}) : super(key: key);

  @override
  _AdminCategoryUpdateContentState createState() => _AdminCategoryUpdateContentState();
}

class _AdminCategoryUpdateContentState extends State<AdminCategoryUpdateContent> {
  bool isLoading = false; // Estado de carga

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildContent(context),
          _buildBackButton(context),
          if (isLoading) _buildLoadingIndicator(), // Mostrar loading solo si isLoading es true
        ],
      ),
    );
  }

  // Fondo degradado futurista
  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey.shade900, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  // Contenido principal
  Widget _buildContent(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 100),
            _buildImagePicker(context),
            const SizedBox(height: 30),
            _buildFormContainer(screenSize.height),
          ],
        ),
      ),
    );
  }

  // Imagen seleccionable
  Widget _buildImagePicker(BuildContext context) {
    return GestureDetector(
      onTap: () => SelectOptionImageDialog(
        context,
            () => widget.bloc?.add(PickImage()),
            () => widget.bloc?.add(TakePhoto()),
      ),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipOval(
          child: widget.state.file != null
              ? Image.file(widget.state.file!, fit: BoxFit.cover)
              : widget.category?.image != null
              ? FadeInImage.assetNetwork(
            placeholder: 'assets/img/user_image.png',
            image: widget.category!.image!,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(seconds: 1),
          )
              : Image.asset(
            'assets/img/no-image.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // Contenedor del formulario con diseño futurista
  Widget _buildFormContainer(double screenHeight) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.4), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: widget.state.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            const SizedBox(height: 20),
            _buildNameField(),
            const SizedBox(height: 15),
            _buildDescriptionField(),
            const SizedBox(height: 30),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  // Título del formulario
  Widget _buildTitle() {
    return Text(
      'Actualizar Categoría',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white.withOpacity(0.9),
      ),
    );
  }

  // Campo de texto para el nombre
  Widget _buildNameField() {
    return _buildTextField(
      label: 'Nombre de la categoría',
      icon: Icons.category,
      initialValue: widget.category?.name ?? '',
      onChange: (text) => widget.bloc?.add(NameChanged(name: BlocFormItem(value: text))),
      error: widget.state.name.error,
    );
  }

  // Campo de texto para la descripción
  Widget _buildDescriptionField() {
    return _buildTextField(
      label: 'Descripción',
      icon: Icons.list,
      initialValue: widget.category?.description ?? '',
      onChange: (text) => widget.bloc?.add(DescriptionChanged(description: BlocFormItem(value: text))),
      error: widget.state.description.error,
    );
  }

  // Campo de texto reutilizable
  Widget _buildTextField({
    required String label,
    required IconData icon,
    required String initialValue,
    required Function(String) onChange,
    String? error,
  }) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChange,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.purpleAccent),
        ),
      ),
      validator: (_) => error,
    );
  }

  // Botón flotante para enviar
  Widget _buildSubmitButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          if (widget.state.formKey?.currentState?.validate() ?? false) {
            setState(() {
              isLoading = true; // Activamos el indicador de carga
            });

            // Procedemos con la acción (guardado) y añadimos un tiempo de espera para la fluidez
            widget.bloc?.add(FormSubmit()); // Llamamos a la acción de Bloc inmediatamente

            // Simulamos un retraso antes de desactivar el loading para dar la sensación de un proceso
            Future.delayed(const Duration(seconds: 5), () {
              setState(() {
                isLoading = false; // Desactivamos el indicador de carga
              });
            });
          }
        },
        icon: const Icon(Icons.check, color: Colors.white),
        label: const Text('Guardar'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  // Botón de retroceso flotante
  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 50,
      left: 15,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  // Indicador de carga con retraso
  Widget _buildLoadingIndicator() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Guardando...',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
