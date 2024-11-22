import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/category/CategoryUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/category/list/bloc/StudentCategoryListEvent.dart';
import 'package:sppp/src/presentation/pages/student/category/list/bloc/StudentCategoryListState.dart';


class StudentCategoryListBloc extends Bloc<StudentCategoryListEvent, StudentCategoryListState> {
  CategoriesUseCases categoriesUseCases;

  StudentCategoryListBloc(this.categoriesUseCases): super (StudentCategoryListState()){
    on<GetCategories>(_onGetCategories);
    //on<DeleteCategory>(_onDeleteCategories);
  }
  Future <void>_onGetCategories(GetCategories event, Emitter<StudentCategoryListState> emit) async {
    emit(
        state.copyWith(
            response: Loading()
        )
    );
    Resource response = await categoriesUseCases.getCategories.run();
    emit(
        state.copyWith(
            response: response
        )
    );
  }


  /*Future <void>_onDeleteCategories(DeleteCategory event, Emitter<AdminCategoryListState> emit) async {
    emit(
        state.copyWith(
            response: Loading()
        )
    );
    Resource response = await categoriesUseCases.delete.run(event.id);
    emit(
        state.copyWith(
            response: response
        )
    );
  }*/

}