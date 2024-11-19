import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListEvent.dart';

class AdminCoursesListItem extends StatefulWidget {
  final AdminCoursesListBloc? bloc;
  final Courses? courses;

  AdminCoursesListItem(this.bloc, this.courses);

  @override
  _AdminCoursesListItemState createState() => _AdminCoursesListItemState();
}

class _AdminCoursesListItemState extends State<AdminCoursesListItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'admin/product/list', arguments: category);
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
            // Imagen del curso
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: widget.courses?.image1?.isNotEmpty ?? false
                  ? FadeInImage.assetNetwork(
                placeholder: 'assets/img/no-image.png',
                image: widget.courses!.image1!,
                fit: BoxFit.contain,
                width: 70,
                height: 70,
                fadeInDuration: Duration(seconds: 1),
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
            SizedBox(width: 16),
            // Contenido de la tarjeta
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.courses?.name ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.courses?.description ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$ ${widget.courses?.price.toString() ?? ''}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12),
            // Botones de acción con estilo
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      'admin/courses/update',
                      arguments: widget.courses,
                    );
                  },
                  icon: Icon(Icons.edit),
                  color: Colors.blueAccent,
                  tooltip: 'Editar Curso',
                ),
                SizedBox(height: 8),
                IconButton(
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.redAccent,
                  tooltip: 'Eliminar Curso',
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
                  '¿Estás seguro de que deseas eliminar este curso?\nEsta acción no se puede deshacer.',
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
                        if (widget.courses != null) {
                          widget.bloc?.add(DeleteCourses(id: widget.courses!.id!));
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
