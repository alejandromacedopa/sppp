import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';

class AdminCategoryListItem extends StatefulWidget {
  final AdminCategoryListBloc? bloc;
  final Category? category;

  AdminCategoryListItem(this.bloc, this.category);

  @override
  _AdminCategoryListItemState createState() => _AdminCategoryListItemState();
}

class _AdminCategoryListItemState extends State<AdminCategoryListItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'admin/courses/list', arguments: widget.category);
      },
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(isPressed ? 0.98 : 1.0), // Escala al presionar
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: EdgeInsets.all(16),
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
            SizedBox(width: 16),
            // Imagen principal
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: widget.category?.image != null
                  ? FadeInImage.assetNetwork(
                placeholder: 'assets/img/no-image.png',
                image: widget.category!.image!,
                fit: BoxFit.cover,
                width: 70,
                height: 70,
                fadeInDuration: Duration(milliseconds: 500),
              )
                  : Container(
                width: 70,
                height: 70,
                color: Colors.grey[200],
                child: Icon(Icons.image, color: Colors.grey[500]),
              ),
            ),
            SizedBox(width: 16),
            // Título y subtítulo
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.category?.name ?? 'Sin título',
                    style: TextStyle(
                      fontSize: 20,  // Título más grande
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    widget.category?.description ?? 'Sin descripción',
                    style: TextStyle(
                      fontSize: 16,  // Descripción más grande
                      color: Colors.grey[700],  // Mejor contraste
                      height: 1.4,  // Espaciado más grande
                      fontWeight: FontWeight.w500, // Ligera negrita para resaltar
                    ),
                    maxLines: null,  // Permitir varias líneas sin recorte
                    overflow: TextOverflow.visible,  // No recortar el texto
                  ),
                ],
              ),
            ),
            SizedBox(width: 12),
            // Botones de acción con tamaño más pequeño
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'admin/category/update',
                        arguments: widget.category);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8),  // Tamaño reducido
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Icon(Icons.edit, color: Colors.white, size: 20),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8),  // Tamaño reducido
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Icon(Icons.delete, color: Colors.white, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Método para mostrar el cuadro de confirmación
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,  // Evita que el usuario cierre el cuadro tocando fuera de él
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 16,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.amber[800],
                  size: 50,
                ),
                SizedBox(height: 20),
                Text(
                  '¡Advertencia!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '¿Estás seguro de que deseas eliminar esta categoría?\nEsta acción no se puede deshacer.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Cierra el cuadro de diálogo sin eliminar
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Cancelar', style: TextStyle(color: Colors.black87)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (widget.category != null) {
                          widget.bloc?.add(DeleteCategory(id: widget.category!.id!));
                        }
                        Navigator.of(context).pop(); // Cierra el cuadro de diálogo después de eliminar
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Eliminar', style: TextStyle(color: Colors.white)),
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
