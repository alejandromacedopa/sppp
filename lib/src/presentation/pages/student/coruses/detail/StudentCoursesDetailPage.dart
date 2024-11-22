import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/StudentCoursesDetailContent.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailBloc.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailEvent.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailState.dart';

class StudentCoursesDetailPage extends StatefulWidget {
  const StudentCoursesDetailPage({super.key});

  @override
  State<StudentCoursesDetailPage> createState() =>
      _StudentCoursesDetailPageState();
}

class _StudentCoursesDetailPageState extends State<StudentCoursesDetailPage> {
  Courses? courses;
  StudentCoursesDetailBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetCourses(courses: courses!));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc?.add(ResetState());
  }

  @override
  Widget build(BuildContext context) {
    courses = ModalRoute.of(context)?.settings.arguments as Courses;
    _bloc = BlocProvider.of<StudentCoursesDetailBloc>(context);
    return Scaffold(
      body: BlocBuilder<StudentCoursesDetailBloc, StudentCoursesDetailState>(
        builder: (context, state) {
          return StudentCoursesDetailContent(_bloc, state, courses);
        },
      ),
    );
  }
}
