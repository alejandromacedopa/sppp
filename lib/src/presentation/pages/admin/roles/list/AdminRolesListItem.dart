import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Roles.dart';
import 'package:sppp/src/presentation/pages/admin/roles/list/bloc/AdminRolesListBloc.dart';

class AdminRolesListItem extends StatefulWidget {
  final AdminRolesListBloc? bloc;
  final Roles? roles;

  AdminRolesListItem(this.bloc, this.roles);

  @override
  _AdminRolesListItemState createState() => _AdminRolesListItemState();
}

class _AdminRolesListItemState extends State<AdminRolesListItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'admin/product/list');
      },
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(isPressed ? 0.98 : 1.0),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[200]!, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isPressed ? 0.1 : 0.05),
              spreadRadius: 2,
              blurRadius: 12,
              offset: Offset(0, isPressed ? 2 : 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Barra de color indicador
            Container(
              width: 5,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 16),
            // Imagen lateral
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: widget.roles?.image != null
                  ? FadeInImage.assetNetwork(
                placeholder: 'assets/img/noimage.png',
                image: widget.roles!.image!,
                fit: BoxFit.cover,
                width: 70,
                height: 70,
                fadeInDuration: const Duration(milliseconds: 500),
                imageErrorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 60);
                },
              )
                  : Container(
                width: 70,
                height: 70,
                color: Colors.grey[300],
                child: Icon(
                  Icons.image_not_supported,
                  color: Colors.grey[600],
                  size: 30,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Contenido de la tarjeta
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.roles?.name ?? 'Sin nombre',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.roles?.route ?? 'Sin ruta',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Botones de acción
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'create/roles', arguments: widget.roles);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(8),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 20),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(8),
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Icon(Icons.delete, color: Colors.white, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Diálogo de confirmación
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 16,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.amber[800], size: 50),
                const SizedBox(height: 20),
                const Text(
                  '¡Advertencia!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '¿Estás seguro de que deseas eliminar este rol? Esta acción no se puede deshacer.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Cancelar', style: TextStyle(color: Colors.black87)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (widget.roles != null) {
                        // widget.bloc?.add(DeleteRoleEvent(id: widget.roles!.id!));
                        }
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Eliminar', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
