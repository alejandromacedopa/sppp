import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Address.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListBloc.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListEvent.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListState.dart';

class StudentAddressListItem extends StatelessWidget {
  StudentAddressListBloc? bloc;
  StudentAddressListState state;
  Address address;
  int index;

  StudentAddressListItem(this.bloc, this.state, this.address, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio(
            value: index,
            groupValue: state.radioValue,
            onChanged: (value) {
              bloc?.add(ChangeRadioValue(radioValue: value!, address: address));
            },
          ),
          trailing: IconButton(
              onPressed: () {
                bloc?.add(DeleteAddress(id: address.id!));
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              )),
          title: Text(
            address.address,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            address.neighborhood,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          color: Colors.grey[300],
          indent: 30,
          endIndent: 30,
        )
      ],
    );
  }
}