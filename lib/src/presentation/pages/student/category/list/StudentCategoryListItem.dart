import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/presentation/pages/student/category/list/bloc/StudentCategoryListBloc.dart';

class StudentCategoryListItem extends StatefulWidget {
  final StudentCategoryListBloc? bloc;
  final Category? category;

  StudentCategoryListItem(this.bloc, this.category);

  @override
  StudentCategoryListItemState createState() => StudentCategoryListItemState();
}

class StudentCategoryListItemState extends State<StudentCategoryListItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          'student/courses/list',
          arguments: widget.category,
        );
      },
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(isPressed ? 0.98 : 1.0),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isPressed ? Colors.blueAccent : Colors.grey[200]!,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isPressed ? 0.15 : 0.07),
              spreadRadius: 2,
              blurRadius: 8,
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
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    widget.category?.description ?? 'Sin descripción',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                    maxLines: null, // Permite que el texto ocupe todas las líneas necesarias
                    overflow: TextOverflow.visible, // Asegura que el texto no se trunque
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
