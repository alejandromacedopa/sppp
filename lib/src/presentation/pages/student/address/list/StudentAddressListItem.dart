import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Address.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListBloc.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListEvent.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListState.dart';

class StudentAddressListItem extends StatelessWidget {
  final StudentAddressListBloc? bloc;
  final StudentAddressListState state;
  final Address address;
  final int index;

  StudentAddressListItem(this.bloc, this.state, this.address, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Radio Button with Custom Design
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: state.radioValue == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey[300]!,
                    width: 2,
                  ),
                ),
                child: Radio<int>(
                  value: index,
                  groupValue: state.radioValue,
                  onChanged: (value) {
                    if (value != null) {
                      bloc?.add(ChangeRadioValue(radioValue: value, address: address));
                    }
                  },
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 16.0),
              // Address Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.address,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF333333),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      address.neighborhood,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              // Delete Button with Tooltip
              Tooltip(
                message: "Eliminar dirección",
                child: GestureDetector(
                  onTap: () {
                    bloc?.add(DeleteAddress(id: address.id!));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
