import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:sppp/src/presentation/pages/admin/courses/create/AdminCoursesCreateContent.dart';
import 'package:sppp/src/presentation/pages/admin/courses/create/bloc/AdminCoursesCreateBloc.dart';
import 'package:sppp/src/presentation/pages/admin/courses/create/bloc/AdminCoursesCreateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/courses/create/bloc/AdminCoursesCreateState.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListBloc.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListEvent.dart';

class AdminCoursesCreatePage extends StatefulWidget {
  const AdminCoursesCreatePage({super.key});

  @override
  State<AdminCoursesCreatePage> createState() => _AdminCoursesCreatePage();
}

class _AdminCoursesCreatePage extends State<AdminCoursesCreatePage> {
  AdminCoursesCreateBloc? _bloc;
  Category? category;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(AdminCoursesCreateInitEvent(category: category));
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminCoursesCreateBloc>(context);
    category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
      body: BlocListener<AdminCoursesCreateBloc, AdminCoursesCreateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            context.read<AdminCategoryListBloc>().add(GetCategories());
            context
                .read<AdminCoursesListBloc>()
                .add(GetCoursesByCategory(idCategory: category!.id!));
            _bloc?.add(ResetForm());
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: 'El Curso se creo correctamente',
                toastLength: Toast.LENGTH_LONG);
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<AdminCoursesCreateBloc, AdminCoursesCreateState>(
          builder: (context, state) {
            return AdminCoursesCreateContent(_bloc, state);
          },
        ),
      ),
    );
  }
}