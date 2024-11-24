import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagBloc.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagEvent.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagState.dart';

class StudentShoppingBagItem extends StatelessWidget {
  final StudentShoppingBagBloc? bloc;
  final StudentShoppingBagState state;
  final Courses? courses;

  StudentShoppingBagItem(this.bloc, this.state, this.courses);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          _imageProduct(),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textProduct(),
                SizedBox(height: 8),
                _actionsAddAndSubtract(),
              ],
            ),
          ),
          Column(
            children: [
              _textPrice(),
              SizedBox(height: 10),
              _iconRemove(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionsAddAndSubtract() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => bloc?.add(SubtractItem(courses: courses!)),
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Text(
              '-',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: 40,
          height: 35,
          alignment: Alignment.center,
          color: Colors.grey[100],
          child: Text(
            courses?.quantity.toString() ?? '0',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        GestureDetector(
          onTap: () => bloc?.add(AddItem(courses: courses!)),
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Text(
              '+',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textPrice() {
    return Text(
      courses != null
          ? '\S/.${(courses!.price).toStringAsFixed(2)}'
          : '',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.blue[700],
      ),
    );
  }

  Widget _iconRemove(BuildContext context) {
    return IconButton(
      onPressed: () => _showDeleteConfirmation(context),
      icon: Icon(Icons.delete, color: Colors.red[600], size: 24),
      tooltip: "Eliminar producto",
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.redAccent,
                size: 60,
              ),
              SizedBox(height: 15),
              Text(
                "Eliminar producto",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "¿Estás seguro de que deseas eliminar este producto del carrito?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Cerrar el diálogo sin eliminar
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bloc?.add(RemoveItem(courses: courses!)); // Acción de eliminación
                      Navigator.pop(context); // Cerrar el diálogo después de eliminar
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Eliminar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _textProduct() {
    return Text(
      courses?.name ?? 'Producto desconocido',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.grey[800],
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _imageProduct() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
        image: courses != null && courses!.image1!.isNotEmpty
            ? DecorationImage(
          image: NetworkImage(courses!.image1!),
          fit: BoxFit.cover,
        )
            : null,
      ),
      child: courses == null || courses!.image1!.isEmpty
          ? Icon(Icons.image_not_supported, size: 30, color: Colors.grey[400])
          : null,
    );
  }
}
