import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/courses/CoursesUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/coruses/list/bloc/StudentCoursesListEvent.dart';
import 'package:sppp/src/presentation/pages/student/coruses/list/bloc/StudentCoursesListState.dart';

class StudentCoursesListBloc
    extends Bloc<StudentCoursesListEvent, StudentCoursesListState> {
  CoursesUseCases coursesUseCases;

  StudentCoursesListBloc(this.coursesUseCases) : super(StudentCoursesListState()) {
    on<GetCoursesByCategory>(_onGetCoursesByCategory);
    on<DeleteCourses>(_onDeleteCourses);
  }

  Future<void> _onGetCoursesByCategory(
      GetCoursesByCategory event, Emitter<StudentCoursesListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response =
    await coursesUseCases.getCoursesByCategory.run(event.idCategory);
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteCourses(
      DeleteCourses event, Emitter<StudentCoursesListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await coursesUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
