import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/StudentShoppingBagBottomBar.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/StudentShoppingBagItem.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagBloc.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagEvent.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagState.dart';

class StudentShoppingBagPage extends StatefulWidget {
  const StudentShoppingBagPage({super.key});

  @override
  State<StudentShoppingBagPage> createState() => _StudentShoppingBagPageState();
}

class _StudentShoppingBagPageState extends State<StudentShoppingBagPage> {
  StudentShoppingBagBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetShoppingBag());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<StudentShoppingBagBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi orden'),
      ),
      body: BlocBuilder<StudentShoppingBagBloc, StudentShoppingBagState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.courses.length,
              itemBuilder: (context, index) {
                return StudentShoppingBagItem(
                    _bloc, state, state.courses[index]);
              });
        },
      ),
      bottomNavigationBar:
          BlocBuilder<StudentShoppingBagBloc, StudentShoppingBagState>(
        builder: (context, state) {
          return StudentShoppingBagBottomBar(state);
        },
      ),
    );
  }
}
