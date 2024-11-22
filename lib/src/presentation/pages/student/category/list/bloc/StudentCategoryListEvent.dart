import 'package:equatable/equatable.dart';

abstract class StudentCategoryListEvent extends Equatable {
  const StudentCategoryListEvent();
  @override
  List<Object?> get props => [];

}

class GetCategories extends StudentCategoryListEvent{
  const GetCategories();
}

/*class DeleteCategory extends StudentCategoryListEvent{
  final int id;
  const DeleteCategory({required this.id});

  @override
  List<Object?> get props => [id];
}*/