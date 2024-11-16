import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeEvent.dart';
import 'package:sppp/src/presentation/pages/student/home/bloc/StudentHomeState.dart';

class StudentHomeBloc extends Bloc<StudentHomeEvent, StudentHomeState> {
  AuthUseCases authUseCases;

  StudentHomeBloc(this.authUseCases) : super(StudentHomeState()) {
    on<StudentLogout>(_onStudentLogout);
    on<StudentChangeDrawerPage>(_onStudentChangeDrawerPage);
  }

  Future<void> _onStudentLogout(
      StudentLogout event, Emitter<StudentHomeState> emit) async {
    await authUseCases.logout.run();
  }

  Future<void> _onStudentChangeDrawerPage(
      StudentChangeDrawerPage event, Emitter<StudentHomeState> emit) async {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }
}