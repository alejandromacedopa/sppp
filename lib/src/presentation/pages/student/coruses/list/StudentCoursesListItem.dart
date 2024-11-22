
import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/presentation/pages/student/coruses/list/bloc/StudentCoursesListBloc.dart';

class StudentCoursesListItem extends StatelessWidget {
  StudentCoursesListBloc? bloc;
  Courses? courses;

  StudentCoursesListItem(this.bloc, this.courses);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'student/courses/detail',
            arguments: courses);
      },
      child: ListTile(
        trailing: courses != null
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
            : Container(),
        title: Text(courses?.name ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(courses?.description ?? ''),
            SizedBox(height: 5),
            Text(
              '\$ ${courses?.price.toString() ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        // contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
      ),
    );
  }
}
