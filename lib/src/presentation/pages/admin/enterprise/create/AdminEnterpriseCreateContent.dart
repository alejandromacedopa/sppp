import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';
import 'package:sppp/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:sppp/src/presentation/widget/DefaultIconBack.dart';

class AdminEnterpriseCreateContent extends StatelessWidget {
  AdminEnterpriseCreateBloc? bloc;
  AdminEnterpriseCreateState state;

  AdminEnterpriseCreateContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 215),
              child: Column(
                children: [
                  _imageRooms(context),
                  SizedBox(height: 50), // Espacio entre la imagen y la card
                  _cardRoomsForm(context),
                ],
              ),
            ),
          ),
          DefaultIconBack(left: 15, top: 50),
        ],
      ),
    );
  }

  Widget _cardRoomsForm(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textNewRooms(),
            SizedBox(height: 20),
            _textFieldName(),
            SizedBox(height: 20),
            _textFieldDescription(),
            SizedBox(height: 30),
            _fabSubmit(),
          ],
        ),
      ),
    );
  }

  Widget _fabSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      child: FloatingActionButton(
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(FormSubmit());
          }
        },
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _textNewRooms() {
    return Text(
      'Ingrese Nueva Empresa',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  Widget _textFieldName() {
    return _customButtonTextField(
      label: 'Nombre de la Empresa',
      icon: Icons.room,
      onChanged: (text) {
        bloc?.add(NameChanged(name: BlocFormItem(value: text)));
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingrese el nombre de la empresa';
        }
        return state.name.error; // Mostrar otro mensaje de error si existe
      },
    );
  }

  Widget _textFieldDescription() {
    return _customButtonTextField(
      label: 'Nombre del Supervisor',
      icon: Icons.list,
      onChanged: (text) {
        bloc?.add(SupervisorChanged(supervisor: BlocFormItem(value: text)));
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El nombre del supervisor no puede estar vacío';
        }
        return state
            .supervisor.error; // Mostrar otro mensaje de error si existe
      },
    );
  }

  Widget _customButtonTextField({
    required String label,
    required IconData icon,
    required Function(String) onChanged,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black54),
        prefixIcon: Icon(icon, color: Colors.black),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.purple, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }

  Widget _imageRooms(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(
          context,
              () {
            bloc?.add(PickImage());
          },
              () {
            bloc?.add(TakePhoto());
          },
        );
      },
      child: Container(
        width: 140,
        height: 140,
        margin: EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
        ),
        child: ClipOval(
          child: state.file != null
              ? Image.file(
            state.file!,
            fit: BoxFit.cover,
          )
              : Image.asset(
            'assets/img/no-image.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/hotel.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.5),
      colorBlendMode: BlendMode.darken,
    );
  }
}