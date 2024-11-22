import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailBloc.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailEvent.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailState.dart';
import 'package:sppp/src/presentation/widget/DefaultButton.dart';
import 'package:sppp/src/presentation/widget/DefaultIconBack.dart';

class StudentCoursesDetailContent extends StatelessWidget {
  Courses? courses;
  StudentCoursesDetailBloc? bloc;
  StudentCoursesDetailState state;

  StudentCoursesDetailContent(this.bloc, this.state, this.courses);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageSlideshow(),
            _textName(),
            _textDescription(),
            _textPrice(),
            Spacer(),
            Divider(color: Colors.grey[300], height: 0, thickness: 2),
            _actionsShoppingBag()
          ],
        ),
        DefaultIconBack(
          left: 15,
          top: 35,
          color: Colors.black,
        )
      ],
    );
  }

  Widget _actionsShoppingBag() {
    return Container(
      color: Colors.grey[100],
      width: double.infinity,
      padding: EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              bloc?.add(SubtractItem());
            },
            child: Container(
              width: 40,
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  )),
              child: Text(
                '-',
                style: TextStyle(fontSize: 23),
              ),
            ),
          ),
          Container(
            width: 40,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Text(
              state.quantity.toString(),
              style: TextStyle(fontSize: 23),
            ),
          ),
          GestureDetector(
            onTap: () {
              bloc?.add(AddItem());
            },
            child: Container(
              width: 40,
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
              child: Text(
                '+',
                style: TextStyle(fontSize: 23),
              ),
            ),
          ),
          Spacer(),
          Container(
            width: 150,
            child: DefaultButton(
                text: 'AGREGAR',
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: 'Se agrego el producto',
                      toastLength: Toast.LENGTH_LONG);
                  bloc?.add(AddCoursesToShoppingBag(courses: courses!));
                }),
          )
        ],
      ),
    );
  }

  Widget _textName() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 30),
      child: Text(
        courses?.name ?? '',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textDescription() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 15),
      child: Text(
        courses?.description ?? '',
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }

  Widget _textPrice() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 15),
      child: Text(
        'Precio: ${courses?.price ?? ''}',
        style: TextStyle(
            fontSize: 17, color: Colors.green, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _imageSlideshow() {
    return ImageSlideshow(
      width: double.infinity,
      height: 300,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      children: [
        courses!.image1!.isNotEmpty
            ? FadeInImage.assetNetwork(
                placeholder: 'assets/img/user_image.png',
                image: courses!.image1!,
                fit: BoxFit.contain,
                fadeInDuration: Duration(seconds: 1),
              )
            : Container(),
        courses!.image2!.isNotEmpty
            ? FadeInImage.assetNetwork(
                placeholder: 'assets/img/user_image.png',
                image: courses!.image2!,
                fit: BoxFit.contain,
                fadeInDuration: Duration(seconds: 1),
              )
            : Container(),
      ],

      /// Called whenever the page in the center of the viewport changes.
      onPageChanged: (value) {
        print('Page changed: $value');
      },
      // autoPlayInterval: 10000,
      // isLoop: true,
    );
  }
}
