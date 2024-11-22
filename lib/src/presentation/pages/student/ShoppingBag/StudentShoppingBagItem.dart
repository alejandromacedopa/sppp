import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagBloc.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagEvent.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagState.dart';

class StudentShoppingBagItem extends StatelessWidget {
  StudentShoppingBagBloc? bloc;
  StudentShoppingBagState state;
  Courses? courses;

  StudentShoppingBagItem(this.bloc, this.state, this.courses);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        children: [
          _imageProduct(),
          SizedBox(width: 15),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _textProduct(),
            SizedBox(height: 5),
            _actionsAddAndSubtract()
          ]),
          Spacer(),
          Column(
            children: [_textPrice(), _iconRemove()],
          )
        ],
      ),
    );
  }

  Widget _actionsAddAndSubtract() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            bloc?.add(SubtractItem(courses: courses!));
          },
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                )),
            child: Text(
              '-',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Container(
          width: 35,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Text(
            courses?.quantity.toString() ?? '',
            style: TextStyle(fontSize: 18),
          ),
        ),
        GestureDetector(
          onTap: () {
            bloc?.add(AddItem(courses: courses!));
          },
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            child: Text(
              '+',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textPrice() {
    return courses != null
        ? Text(
            '\S/.${courses!.price * courses!.quantity!}',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          )
        : Container();
  }

  Widget _iconRemove() {
    return IconButton(
        onPressed: () {
          bloc?.add(RemoveItem(courses: courses!));
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ));
  }

  Widget _textProduct() {
    return Container(
      width: 170,
      child: Text(
        courses?.name ?? 'Titulo del producto',
        // overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _imageProduct() {
    return courses != null
        ? Container(
            width: 70,
            child: courses!.image1!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/img/no-image.png',
                    image: courses!.image1!,
                    fit: BoxFit.contain,
                    fadeInDuration: Duration(seconds: 1),
                  )
                : Container(),
          )
        : Image.asset(
            'assets/img/no-image.png',
            width: 80,
          );
  }
}
