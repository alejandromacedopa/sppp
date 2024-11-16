import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListEvent.dart';

class AdminEnterpriseListItem extends StatelessWidget {
  final AdminEnterpriseListBloc? bloc;
  final Enterprise? enterprise;

  AdminEnterpriseListItem(this.bloc, this.enterprise);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'admin/rooms/list', arguments: enterprise);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Stack(
          children: [
            // Background image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: enterprise?.logo_image_url != null
                  ? FadeInImage.assetNetwork(
                placeholder: 'assets/img/no-image.png',
                image: enterprise!.logo_image_url!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 220,
              )
                  : Image.asset(
                'assets/img/no-image.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 220,
              ),
            ),
            // Overlay with room information
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 15,
              right: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    enterprise?.name ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    enterprise?.supervisor ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(1, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            // Edit and Delete buttons
            Positioned(
              top: 10,
              right: 10,
              child: Row(
                children: [
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 25, // Hacer el avatar más grande
                    backgroundColor:
                    Colors.redAccent, // Usar un color más llamativo
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Bordes redondeados en el diálogo
                              ),
                              title: Text(
                                "Confirmar eliminación",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                              ),
                              content: Text(
                                "¿Estás seguro de que deseas eliminar esta habitación?",
                                style: TextStyle(fontSize: 16),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Cerrar el diálogo sin eliminar
                                  },
                                  child: Text(
                                    "Cancelar",
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    bloc?.add(DeleteEnterprise(
                                        id: enterprise!.id!)); // Eliminar habitación
                                    Navigator.of(context)
                                        .pop(); // Cerrar el diálogo después de eliminar
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .redAccent, // Cambiar "primary" por "backgroundColor"
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20), // Bordes redondeados
                                    ),
                                  ),
                                  child: Text(
                                    "Eliminar",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 28, // Aumentar el tamaño del icono
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
