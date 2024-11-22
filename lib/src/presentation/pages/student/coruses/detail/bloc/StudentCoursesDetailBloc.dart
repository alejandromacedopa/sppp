import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailEvent.dart';
import 'package:sppp/src/presentation/pages/student/coruses/detail/bloc/StudentCoursesDetailState.dart';

class StudentCoursesDetailBloc
    extends Bloc<StudentCoursesDetailEvent, StudentCoursesDetailState> {
  ShoppingBagUseCases shoppingBagUseCases;

  StudentCoursesDetailBloc(this.shoppingBagUseCases)
      : super(StudentCoursesDetailState()) {
    on<GetCourses>(_onGetCourses);
    on<AddItem>(_onAddItem);
    on<SubtractItem>(_onSubtractItem);
    on<AddCoursesToShoppingBag>(_onAddCoursesToShoppingBag);
    on<ResetState>(_onResetState);
  }

  Future<void> _onGetCourses(
      GetCourses event, Emitter<StudentCoursesDetailState> emit) async {
    List<Courses> courses = await shoppingBagUseCases.getCourses.run();
    int index = courses.indexWhere((p) => p.id == event.courses.id);
    if (index != -1) {
      emit(state.copyWith(quantity: courses[index].quantity));
    }
  }

  Future<void> _onAddItem(
      AddItem event, Emitter<StudentCoursesDetailState> emit) async {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  Future<void> _onSubtractItem(
      SubtractItem event, Emitter<StudentCoursesDetailState> emit) async {
    if (state.quantity >= 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  Future<void> _onAddCoursesToShoppingBag(AddCoursesToShoppingBag event,
      Emitter<StudentCoursesDetailState> emit) async {
    event.courses.quantity = state.quantity;
    shoppingBagUseCases.add.run(event.courses);
  }

  Future<void> _onResetState(
      ResetState event, Emitter<StudentCoursesDetailState> emit) async {
    emit(state.copyWith(quantity: 0));
  }
}
