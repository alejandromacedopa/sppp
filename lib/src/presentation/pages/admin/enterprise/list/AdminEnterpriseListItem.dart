import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/list/bloc/AdminEnterpriseListEvent.dart';

class AdminEnterpriseListItem extends StatefulWidget {
  final AdminEnterpriseListBloc? bloc;
  final Enterprise? enterprise;

  AdminEnterpriseListItem(this.bloc, this.enterprise);

  @override
  _AdminEnterpriseListItemState createState() => _AdminEnterpriseListItemState();
}

class _AdminEnterpriseListItemState extends State<AdminEnterpriseListItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'admin/rooms/list', arguments: widget.enterprise);
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
        child: IntrinsicHeight(
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
              // Imagen lateral
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: widget.enterprise?.logoImageUrl != null
                    ? Image.network(
                  widget.enterprise!.logoImageUrl!,
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : Center(child: CircularProgressIndicator());
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
              SizedBox(width: 16),
              // Contenido de la tarjeta
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.enterprise?.name ?? 'Empresa desconocida',
                      style: TextStyle(
                        fontSize: 20, // Título más grande
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.person, size: 18, color: Colors.grey),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            widget.enterprise?.supervisor ?? 'Sin supervisor',
                            style: TextStyle(
                              fontSize: 16, // Descripción más grande
                              color: Colors.grey[700],
                              height: 1.4,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
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
                      Navigator.pushNamed(
                        context,
                        'admin/enterprise/update',
                        arguments: widget.enterprise,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(8), // Tamaño reducido
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí aplicamos la misma advertencia exacta que en Category
                      showDialog(
                        context: context,
                        barrierDismissible: false, // Evita que el usuario cierre el cuadro tocando fuera de él
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
                                    '¿Estás seguro de que deseas eliminar esta empresa?\nEsta acción no se puede deshacer.',
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
                                          widget.bloc?.add(DeleteEnterprise(id: widget.enterprise!.id!));
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
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(8), // Tamaño reducido
                      backgroundColor: Colors.redAccent,
                    ),
                    child: Icon(Icons.delete, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
