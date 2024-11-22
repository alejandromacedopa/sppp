import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/coruses/list/StudentCoursesListItem.dart';
import 'package:sppp/src/presentation/pages/student/coruses/list/bloc/StudentCoursesListBloc.dart';
import 'package:sppp/src/presentation/pages/student/coruses/list/bloc/StudentCoursesListEvent.dart';
import 'package:sppp/src/presentation/pages/student/coruses/list/bloc/StudentCoursesListState.dart';

class StudentCoursesListPage extends StatefulWidget {
  const StudentCoursesListPage({super.key});

  @override
  State<StudentCoursesListPage> createState() => _StudentCoursesListPageState();
}

class _StudentCoursesListPageState extends State<StudentCoursesListPage> {
  StudentCoursesListBloc? _bloc;
  Category? category;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (category != null) {
        _bloc?.add(GetCoursesByCategory(idCategory: category!.id!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)?.settings.arguments as Category;
    _bloc = BlocProvider.of<StudentCoursesListBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cursos'),
        ),
        body: BlocListener<StudentCoursesListBloc, StudentCoursesListState>(
            listener: (context, state) {
              final responseState = state.response;
              if (responseState is Success) {
                if (responseState.data is bool) {
                  _bloc?.add(GetCoursesByCategory(idCategory: category!.id!));
                }
              } else if (responseState is Error) {
                Fluttertoast.showToast(
                    msg: responseState.message, toastLength: Toast.LENGTH_LONG);
              }
            }, child: BlocBuilder<StudentCoursesListBloc, StudentCoursesListState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (responseState is Success) {
              List<Courses> courses = responseState.data as List<Courses>;
              return ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return StudentCoursesListItem(_bloc, courses[index]);
                  });
            }
            return Container();
          },
        )));
  }
}
