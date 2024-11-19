import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sppp/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';
import 'package:sppp/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:sppp/src/presentation/widget/DefaultIconBack.dart';
import 'package:sppp/src/presentation/widget/DefaultTextField.dart';


class AdminCategoryCreateContent extends StatelessWidget {
  AdminCategoryCreateBloc? bloc;
  AdminCategoryCreateState state;

  AdminCategoryCreateContent(this.bloc, this.state);

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
                    _cardCategoryForm(context)
                  ],
                ),
              ),
            ),
            DefaultIconBack(left: 15, top: 50)
          ],
        ));
  }

  Widget _cardCategoryForm(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
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
        'NUEVA CATEGORIA',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget _textFieldName() {
    return DefaultTextField(
      label: 'Nombre de la categoria',
      icon: Icons.category,
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
      onChange: (text) {
        bloc?.add(DescriptionChanged(description: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.description.error;
      },
      color: Colors.black,
    );
  }

  Widget _imageCategory(BuildContext context) {
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
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
              child: state.file != null
                  ? Image.file(
                state.file!,
                fit: BoxFit.cover,
              )
                  : Image.asset(
                'assets/img/no-image.png',
                fit: BoxFit.cover,
              )),
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