import 'package:flutter/material.dart';
import 'package:sppp/src/presentation/pages/admin/courses/create/bloc/AdminCoursesCreateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/courses/create/bloc/AdminCoursesCreateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/courses/create/bloc/AdminCoursesCreateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';
import 'package:sppp/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:sppp/src/presentation/widget/DefaultIconBack.dart';
import 'package:sppp/src/presentation/widget/DefaultTextField.dart';

class AdminCoursesCreateContent extends StatelessWidget {
  AdminCoursesCreateBloc? bloc;
  AdminCoursesCreateState state;

  AdminCoursesCreateContent(this.bloc, this.state);

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _imageProductOne(context),
                        SizedBox(width: 20),
                        _imageProductTwo(context)
                      ],
                    ),
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
      height: MediaQuery.of(context).size.height * 0.53,
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
            _textNewProduct(),
            _textFieldName(),
            _textFieldDescription(),
            _textFieldPrice(),
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

  Widget _textNewProduct() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10, bottom: 10),
      child: Text(
        'NUEVO CURSO',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget _textFieldName() {
    return DefaultTextField(
      label: 'Nombre del Curso',
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

  Widget _textFieldPrice() {
    return DefaultTextField(
      label: 'Precio del Curso',
      icon: Icons.money,
      textInputType: TextInputType.phone,
      onChange: (text) {
        bloc?.add(PriceChanged(price: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.price.error;
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

  Widget _imageProductOne(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(
          context,
              () {
            bloc?.add(PickImage(numberFile: 1));
          },
              () {
            bloc?.add(TakePhoto(numberFile: 1));
          },
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
              child: state.file1 != null
                  ? Image.file(
                state.file1!,
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

  Widget _imageProductTwo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(
          context,
              () {
            bloc?.add(PickImage(numberFile: 2));
          },
              () {
            bloc?.add(TakePhoto(numberFile: 2));
          },
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
              child: state.file2 != null
                  ? Image.file(
                state.file2!,
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
