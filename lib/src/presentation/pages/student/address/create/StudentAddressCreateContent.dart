import 'package:flutter/material.dart';
import 'package:sppp/src/presentation/pages/student/address/create/bloc/StudentAddressCreateBloc.dart';
import 'package:sppp/src/presentation/pages/student/address/create/bloc/StudentAddressCreateEvent.dart';
import 'package:sppp/src/presentation/pages/student/address/create/bloc/StudentAddressCreateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';
import 'package:sppp/src/presentation/widget/DefaultIconBack.dart';
import 'package:sppp/src/presentation/widget/DefaultTextField.dart';

class StudentAddressCreateContent extends StatelessWidget {
  StudentAddressCreateBloc? bloc;
  StudentAddressCreateState state;

  StudentAddressCreateContent(this.bloc, this.state);

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
      height: MediaQuery.of(context).size.height * 0.42,
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
            _textNewAddress(),
            _textFieldAddress(),
            _textFieldNeighborhood(),
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

  Widget _textNewAddress() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10, bottom: 10),
      child: Text(
        'NUEVA DIRECCION',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget _textFieldAddress() {
    return DefaultTextField(
      label: 'Direccion',
      icon: Icons.my_location,
      onChange: (text) {
        bloc?.add(AddressChanged(address: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.address.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldNeighborhood() {
    return DefaultTextField(
      label: 'Barrio',
      icon: Icons.location_on,
      onChange: (text) {
        bloc?.add(NeighborhoodChanged(neighborhood: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.neighborhood.error;
      },
      color: Colors.black,
    );
  }

  Widget _imageCategory(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: Image.asset(
        'assets/img/location.png',
        fit: BoxFit.cover,
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/address_background2.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
