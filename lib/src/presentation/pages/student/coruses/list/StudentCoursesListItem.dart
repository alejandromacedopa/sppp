import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/presentation/pages/student/coruses/list/bloc/StudentCoursesListBloc.dart';

class StudentCoursesListItem extends StatelessWidget {
  final StudentCoursesListBloc? bloc;
  final Courses? courses;

  StudentCoursesListItem(this.bloc, this.courses);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (courses != null) {
          Navigator.pushNamed(context, 'student/courses/detail', arguments: courses);
        }
      },
      child: Card(
        elevation: 8.0, // Sombra más prominente para darle un toque moderno
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Bordes más redondeados
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Márgenes más grandes
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Padding generoso para más espacio
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del curso con bordes redondeados
              courses?.image1?.isNotEmpty ?? false
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/no-image.png',
                  image: courses!.image1!,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                ),
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  color: Colors.grey[200], // Fondo gris claro para "no imagen"
                  width: 90,
                  height: 90,
                  child: Icon(
                    Icons.image_not_supported,
                    color: Colors.grey[600],
                    size: 40,
                  ),
                ),
              ),
              SizedBox(width: 20.0), // Espaciado entre la imagen y el contenido

              // Detalles del curso
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título del curso
                    Text(
                      courses?.name ?? 'Curso sin nombre',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blueAccent, // Color más vibrante
                      ),
                    ),
                    SizedBox(height: 8.0), // Espaciado entre el nombre y la descripción

                    // Descripción
                    Text(
                      courses?.description ?? 'Descripción no disponible.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 10.0), // Más espacio entre descripción y precio

                    // Precio con un color más llamativo
                    Text(
                      '\$${courses?.price?.toStringAsFixed(2) ?? '0.00'}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blue[700], // Verde más vibrante
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
