import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagEvent.dart';
import 'package:sppp/src/presentation/pages/student/ShoppingBag/bloc/StudentShoppingBagState.dart';

class StudentShoppingBagBloc
    extends Bloc<StudentShoppingBagEvent, StudentShoppingBagState> {
  ShoppingBagUseCases shoppingBagUseCases;

  StudentShoppingBagBloc(this.shoppingBagUseCases)
      : super(StudentShoppingBagState()) {
    on<GetShoppingBag>(_onGetShoppingBag);
    on<AddItem>(_onAddItem);
    on<SubtractItem>(_onSubtractItem);
    on<RemoveItem>(_onRemoveItem);
    on<GetTotal>(_onGetTotal);
  }

  Future<void> _onGetShoppingBag(
      GetShoppingBag event, Emitter<StudentShoppingBagState> emit) async {
    List<Courses> courses = await shoppingBagUseCases.getCourses.run();
    emit(state.copyWith(courses: courses));
    add(GetTotal());
  }

  Future<void> _onAddItem(
      AddItem event, Emitter<StudentShoppingBagState> emit) async {
    event.courses.quantity = event.courses.quantity! + 1;
    await shoppingBagUseCases.add.run(event.courses);
    add(GetShoppingBag());
  }

  Future<void> _onSubtractItem(
      SubtractItem event, Emitter<StudentShoppingBagState> emit) async {
    if (event.courses.quantity! > 1) {
      event.courses.quantity = event.courses.quantity! - 1;
      await shoppingBagUseCases.add.run(event.courses);
      add(GetShoppingBag());
    }
  }

  Future<void> _onRemoveItem(
      RemoveItem event, Emitter<StudentShoppingBagState> emit) async {
    await shoppingBagUseCases.deleteItem.run(event.courses);
    add(GetShoppingBag());
  }

  Future<void> _onGetTotal(
      GetTotal event, Emitter<StudentShoppingBagState> emit) async {
    double total = await shoppingBagUseCases.getTotal.run();
    emit(state.copyWith(total: total));
  }
}
