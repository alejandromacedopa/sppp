import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/category/list/StudentCategoryListItem.dart';
import 'package:sppp/src/presentation/pages/student/category/list/bloc/StudentCategoryListBloc.dart';
import 'package:sppp/src/presentation/pages/student/category/list/bloc/StudentCategoryListEvent.dart';
import 'package:sppp/src/presentation/pages/student/category/list/bloc/StudentCategoryListState.dart';


class StudentCategoryListPage extends StatefulWidget {
  const StudentCategoryListPage({super.key});

  @override
  State<StudentCategoryListPage> createState() => _StudentCategoryListPage();
}

class _StudentCategoryListPage extends State<StudentCategoryListPage> {
  StudentCategoryListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetCategories());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<StudentCategoryListBloc>(context);
    return Scaffold(
        /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'admin/category/create');
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),*/
        body: BlocListener<StudentCategoryListBloc, StudentCategoryListState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              if (responseState.data is bool) {
                _bloc?.add(GetCategories());
              }
            }
            if (responseState is Error) {
              Fluttertoast.showToast(
                  msg: responseState.message, toastLength: Toast.LENGTH_LONG);
            }
          },
          child: BlocBuilder<StudentCategoryListBloc, StudentCategoryListState>(
            builder: (context, state) {
              final responseState = state.response;
              if (responseState is Success) {
                List<Category> categories =
                responseState.data as List<Category>;
                return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return StudentCategoryListItem(_bloc, categories[index]);
                    });
              }
              return Container();
            },
          ),
        ));
  }
}
