import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/AdminCoursesListItem.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListEvent.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListState.dart';


class AdminCoursesListPage extends StatefulWidget {
  const AdminCoursesListPage({super.key});

  @override
  State<AdminCoursesListPage> createState() => _AdminCoursesListPage();
}

class _AdminCoursesListPage extends State<AdminCoursesListPage> {
  AdminCoursesListBloc? _bloc;
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
    _bloc = BlocProvider.of<AdminCoursesListBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Cursos'),
          automaticallyImplyLeading:
          true, // Esto asegura que se muestre el botón de retroceso
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'admin/courses/create',
                arguments: category);
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocListener<AdminCoursesListBloc, AdminCoursesListState>(
            listener: (context, state) {
              final responseState = state.response;
              if (responseState is Success) {
                if (responseState.data is bool) {
                  _bloc?.add(GetCoursesByCategory(idCategory: category!.id!));
                }
              }
              if (responseState is Error) {
                Fluttertoast.showToast(
                    msg: responseState.message, toastLength: Toast.LENGTH_LONG);
              }
            }, child: BlocBuilder<AdminCoursesListBloc, AdminCoursesListState>(
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
                    return AdminCoursesListItem(_bloc, courses[index]);
                  });
            }
            return Container();
          },
        )));
  }
}
