import 'package:flutter/material.dart';
import 'package:sppp/src/presentation/pages/student/evidences/create/bloc/AdminEvidenceCreateBloc.dart';
import 'package:sppp/src/presentation/pages/student/evidences/create/bloc/AdminEvidenceCreateEvent.dart';
import 'package:sppp/src/presentation/pages/student/evidences/create/bloc/AdminEvidenceCreateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';
import 'package:sppp/src/presentation/widget/DefaultIconBack.dart';
import 'package:sppp/src/presentation/widget/DefaultTextField.dart';

class AdminEvidenceCreateContent extends StatelessWidget {
  final AdminEvidenceCreateBloc? bloc;
  final AdminEvidenceCreateState state;

  AdminEvidenceCreateContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _cardEvidenceForm(context),
              ],
            ),
          ),
          DefaultIconBack(left: 15, top: 50),
        ],
      ),
    );
  }

  Widget _cardEvidenceForm(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textNewEvidence(),
            SizedBox(height: 20),
            _textFieldName(),
            SizedBox(height: 15),
            _textFieldDescription(),
            SizedBox(height: 15),
            _textFieldEvidenceLink(),
            SizedBox(height: 30),
            _fabSubmit(context),
          ],
        ),
      ),
    );
  }

  Widget _fabSubmit(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FloatingActionButton(
        onPressed: () {
          if (state.formKey?.currentState?.validate() ?? false) {
            print("Enviando el evento FormSubmit");
            bloc?.add(FormSubmit());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Por favor, complete todos los campos correctamente.'),
              ),
            );
          }
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _textNewEvidence() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 10),
      child: Text(
        'NUEVA EVIDENCIA',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return DefaultTextField(
      label: 'Nombre de la Evidencia',
      icon: Icons.event,
      onChange: (text) {
        bloc?.add(NameChanged(name: BlocFormItem(value: text)));
      },
      validator: (value) {
        return value?.isEmpty ?? true
            ? 'Ingresa el nombre de la evidencia'
            : null;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldDescription() {
    return DefaultTextField(
      label: 'Descripción',
      icon: Icons.description,
      onChange: (text) {
        bloc?.add(DescriptionChanged(
            description: BlocFormItem(value: text)));
      },
      validator: (value) {
        return value?.isEmpty ?? true ? 'Ingresa la descripción' : null;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldEvidenceLink() {
    return DefaultTextField(
      label: 'Enlace de la Evidencia',
      icon: Icons.link,
      onChange: (text) {
        bloc?.add(EvidenceLinkChanged(
            evidenceLink: BlocFormItem(value: text)));
      },
      validator: (value) {
        return value?.isEmpty ?? true ? 'Ingresa un enlace válido' : null;
      },
      color: Colors.black,
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background4.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
