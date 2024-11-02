import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Roles.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/bloc/AdminRolesListBloc.dart';

class AdminRolesListItem extends StatelessWidget {
  final AdminRolesListBloc? bloc;
  final Roles? roles;

  AdminRolesListItem(this.bloc, this.roles);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'admin/product/list');
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: roles != null && roles!.image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/img/noimage.png',
                    image: roles!.image!,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                    fadeInDuration: Duration(seconds: 2),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image, size: 60);
                    },
                  ),
                )
              : Icon(Icons.image, size: 60, color: Colors.grey),
          title: Text(
            roles?.name ?? 'Unnamed Role',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            roles?.route ?? 'No Route',
            style: TextStyle(color: Colors.grey[600]),
          ),
          trailing: Wrap(
            spacing: 8, // Espacio entre íconos
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'create/roles',
                      arguments: roles);
                },
                icon: Icon(Icons.edit, color: Colors.blue),
                tooltip: 'Edit Role',
              ),
              IconButton(
                onPressed: () {
                  _showDeleteConfirmation(context);
                },
                icon: Icon(Icons.delete, color: Colors.red),
                tooltip: 'Delete Role',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Role'),
          content: Text('Are you sure you want to delete this role?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (roles != null) {
                  // bloc?.deleteRoles(roles!);
                }
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
