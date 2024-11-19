import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListEvent.dart';
import 'package:sppp/src/presentation/pages/admin/courses/update/AdminCoursesUpdateContent.dart';
import 'package:sppp/src/presentation/pages/admin/courses/update/bloc/AdminCoursesUpdateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/courses/update/bloc/AdminCoursesUpdateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/courses/update/bloc/AdminCoursesUpdateState.dart';


class AdminCoursesUpdatePage extends StatefulWidget {
  const AdminCoursesUpdatePage({super.key});

  @override
  State<AdminCoursesUpdatePage> createState() => _AdminCoursesUpdatePage();
}

class _AdminCoursesUpdatePage extends State<AdminCoursesUpdatePage> {
  AdminCoursesUpdateBloc? _bloc;
  Courses? courses;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(AdminCoursesUpdateInitEvent(courses: courses));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc?.add(ResetForm());
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminCoursesUpdateBloc>(context);
    courses = ModalRoute.of(context)?.settings.arguments as Courses;
    return Scaffold(
      body: BlocListener<AdminCoursesUpdateBloc, AdminCoursesUpdateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            context
                .read<AdminCoursesListBloc>()
                .add(GetCoursesByCategory(idCategory: courses!.idCategory));
            // _bloc?.add(ResetForm());
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: 'El Curso se actualizo correctamente',
                toastLength: Toast.LENGTH_LONG);
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<AdminCoursesUpdateBloc, AdminCoursesUpdateState>(
          builder: (context, state) {
            return AdminCoursesUpdateContent(_bloc, state, courses);
          },
        ),
      ),
    );
  }
}