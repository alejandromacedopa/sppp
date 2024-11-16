import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/bloc/AdminEnterpriseUpdateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/bloc/AdminEnterpriseUpdateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/bloc/AdminEnterpriseUpdateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';
import 'package:sppp/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:sppp/src/presentation/widget/DefaultIconBack.dart';
import 'package:sppp/src/presentation/widget/DefaultTextField.dart';

class AdminEnterpriseUpdateContent extends StatelessWidget {

  AdminEnterpriseUpdateBloc? bloc;
  AdminEnterpriseUpdateState state;
  Enterprise? enterprise;

  AdminEnterpriseUpdateContent(this.bloc, this.state, this.enterprise);

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
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _imageCategory(context),
                    _cardEnterpriseForm(context)
                  ],
                ),
              ),
            ),
            DefaultIconBack(left: 15, top: 50)
          ],
        )
    );
  }

  Widget _cardEnterpriseForm(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.42,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            _textNewCategory(),
            _textFieldName(),
            _textFieldDescription(),
            _fabSubmit()
          ],
        ),
      ),
    );
  }

  Widget _fabSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 30),
      child: FloatingActionButton(
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(FormSubmit());
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

  Widget _textNewCategory() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10, bottom: 10),
      child: Text(
        'ACTUALIZAR EMPRESA',
        style: TextStyle(
            fontSize: 17
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return DefaultTextField(
      label: 'Nombre de la categoria',
      icon: Icons.category,
      initialValue: enterprise?.name ?? '',
      onChange: (text) {
        bloc?.add(NameChanged(name: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.name.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldDescription() {
    return DefaultTextField(
      label: 'Descripcion',
      icon: Icons.list,
      initialValue: enterprise?.supervisor ?? '',
      onChange: (text) {
        bloc?.add(SupervisorChanged(supervisor: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.supervisor.error;
      },
      color: Colors.black,
    );
  }

  Widget _imageCategory(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(
          context,
              () { bloc?.add(PickImage()); },
              () { bloc?.add(TakePhoto()); },
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1/1,
          child: ClipOval(
              child: state.file != null
                  ? Image.file(
                state.file!,
                fit: BoxFit.cover,
              )
                  : enterprise != null
                  ? FadeInImage.assetNetwork(
                placeholder: 'assets/img/user_image.png',
                image: enterprise!.logoImageUrl!,
                fit: BoxFit.cover,
                fadeInDuration: Duration(seconds: 1),
              )
                  :Image.asset(
                'assets/img/no-image.png',
                fit: BoxFit.cover,
              )
          ),
        ),
      ),
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