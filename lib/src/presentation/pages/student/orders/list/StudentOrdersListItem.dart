import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Order.dart';
import 'package:sppp/src/presentation/pages/student/orders/list/bloc/StudentOrdersListBloc.dart';
import 'package:sppp/src/presentation/pages/student/orders/list/bloc/StudentOrdersListState.dart';

class StudentOrdersListItem extends StatelessWidget {
  final StudentOrdersListBloc? bloc;
  final StudentOrdersListState state;
  final Order order;
  final int index;

  StudentOrdersListItem(this.bloc, this.state, this.order, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Card(
        elevation: 8.0, // Mayor profundidad para un efecto más prominente
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Bordes aún más suaves
        ),
        shadowColor: Colors.grey.withOpacity(0.3), // Sombra ligera y difusa
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título principal con diseño destacado
              Text(
                order.idClient,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20, // Aumenté el tamaño para resaltar
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis, // Evitar desbordamiento
              ),
              const SizedBox(height: 10.0),
              // Detalle secundario con un diseño limpio
              Text(
                order.idClient,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20.0),
              // Línea divisoria estilizada
              Divider(
                color: Colors.grey[300],
                thickness: 1.2, // Un poco más gruesa para mayor impacto
                indent: 10, // Margen izquierdo
                endIndent: 10, // Margen derecho
              ),
            ],
          ),
        ),
      ),
    );
  }
}
