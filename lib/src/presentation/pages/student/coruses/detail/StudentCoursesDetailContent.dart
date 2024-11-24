import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/StudentShoppingBagPage.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailBloc.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailEvent.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailState.dart';
import 'package:sppp/src/presentation/pages/student/home/StudentHomePage.dart';
import 'package:sppp/src/presentation/widget/DefaultButton.dart';
import 'package:sppp/src/presentation/widget/DefaultIconBack.dart';

class StudentCoursesDetailContent extends StatelessWidget {
  final Courses? courses;
  final StudentCoursesDetailBloc? bloc;
  final StudentCoursesDetailState state;

  StudentCoursesDetailContent(this.bloc, this.state, this.courses);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _imageSlideshow(),
                _courseDetails(),
                _actionsShoppingBag(context),  // Pasamos el context aquí para la navegación
              ],
            ),
          ),
          DefaultIconBack(
            left: 15,
            top: 35,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _courseDetails() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textName(),
            SizedBox(height: 10),
            _textDescription(),
            SizedBox(height: 15),
            _textPrice(),
          ],
        ),
      ),
    );
  }

  Widget _actionsShoppingBag(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Row(
        children: [
          _buildQuantityButton('-', () {
            bloc?.add(SubtractItem());
          }, isLeft: true),
          Container(
            width: 50,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              state.quantity.toString(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          _buildQuantityButton('+', () {
            bloc?.add(AddItem());
          }),
          Spacer(),
          Container(
            width: 160,
            child: DefaultButton(
              text: 'AGREGAR',
              icon: Icon(Icons.add_shopping_cart, color: Colors.white),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: 'Se agregó el producto',
                  toastLength: Toast.LENGTH_LONG,
                );
                bloc?.add(AddCoursesToShoppingBag(courses: courses!));

                // Navegar a la página del carrito
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentHomePage()), // Navegar a CartPage
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(String symbol, GestureTapCallback? onTap, {bool isLeft = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: isLeft
              ? BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          )
              : BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Text(
          symbol,
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }

  Widget _textName() {
    return Text(
      courses?.name ?? '',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _textDescription() {
    return Text(
      courses?.description ?? '',
      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
    );
  }

  Widget _textPrice() {
    return Text(
      'Precio: ${courses?.price ?? ''}',
      style: TextStyle(
        fontSize: 18,
        color: Colors.green[600],
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _imageSlideshow() {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ImageSlideshow(
        width: double.infinity,
        height: 300,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        children: [
          _loadImage(courses?.image1),
          _loadImage(courses?.image2),
        ],
        onPageChanged: (value) {
          print('Page changed: $value');
        },
      ),
    );
  }

  Widget _loadImage(String? imageUrl) {
    return imageUrl != null && imageUrl.isNotEmpty
        ? FadeInImage.assetNetwork(
      placeholder: 'assets/img/user_image.png',
      image: imageUrl,
      fit: BoxFit.cover,
      fadeInDuration: Duration(seconds: 1),
    )
        : Center(child: CircularProgressIndicator());
  }
}
