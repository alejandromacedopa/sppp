import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/courses/CoursesUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListEvent.dart';
import 'package:sppp/src/presentation/pages/admin/courses/list/bloc/AdminCoursesListState.dart';

class AdminCoursesListBloc
    extends Bloc<AdminCoursesListEvent, AdminCoursesListState> {
  CoursesUseCases coursesUseCases;

  AdminCoursesListBloc(this.coursesUseCases) : super(AdminCoursesListState()) {
    on<GetCoursesByCategory>(_onGetCoursesByCategory);
    on<DeleteCourses>(_onDeleteCourses);
  }

  Future<void> _onGetCoursesByCategory(
      GetCoursesByCategory event, Emitter<AdminCoursesListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response =
    await coursesUseCases.getCoursesByCategory.run(event.idCategory);
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteCourses(
      DeleteCourses event, Emitter<AdminCoursesListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await coursesUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
