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
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[800]!, Colors.blue[400]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Cursos Disponibles',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
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
              msg: responseState.message ?? "Error desconocido.",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
        },
        child: BlocBuilder<StudentCoursesListBloc, StudentCoursesListState>(
          builder: (context, state) {
            final responseState = state.response;

            if (responseState is Loading) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  strokeWidth: 6,
                ),
              );
            } else if (responseState is Success) {
              List<Courses> courses = responseState.data as List<Courses>;

              if (courses.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/notfound.png',
                          height: 300,
                          width: 300,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'No hay cursos disponibles en esta categoría.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Por favor, verifica más tarde o contacta con soporte.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: ListView.builder(
                  key: ValueKey(courses.length),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                      child: Material(
                        elevation: 6,
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'student/courses/detail',
                                arguments: courses[index]);
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: StudentCoursesListItem(_bloc, courses[index]),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (responseState is Error) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 60,
                        color: Colors.red,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Algo salió mal. Por favor, intentalo más tarde.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Si el problema persiste, contacta con soporte.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Center(
              child: Text(
                'No se encontraron cursos.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }
}
