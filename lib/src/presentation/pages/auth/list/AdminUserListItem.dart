import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/User.dart';
import 'package:sppp/src/presentation/pages/auth/list/bloc/AdminUserListBloc.dart';

class AdminUserListItem extends StatelessWidget {
  AdminUserListBloc? bloc;
  User? user;

  AdminUserListItem(this.bloc, this.user);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //Navigator.pushNamed(context, 'admin/product/list');
        },
        child: ListTile(
          leading: user != null
              ? Container(
                  width: 70,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/img/noimage.png',
                    image: user!.image!,
                    fit: BoxFit.contain,
                    fadeInDuration: Duration(seconds: 3),
                  ),
                )
              : Container(),
          title: Text(user?.name ?? ''),
          subtitle: Text(user?.email ?? ''),
          trailing: Wrap(
            direction: Axis.horizontal,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '', arguments: user);
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    //bloc?.deleteRoles(user!);
                  },
                  icon: Icon(Icons.delete)),
            ],
          ),
        ));
  }
}
