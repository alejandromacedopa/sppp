import 'package:equatable/equatable.dart';

abstract class AdminCategoryListEvent extends Equatable {
  const AdminCategoryListEvent();
  @override
  List<Object?> get props => [];

}

class GetCategories extends AdminCategoryListEvent{
  const GetCategories();
}

class DeleteCategory extends AdminCategoryListEvent{
  final int id;
  const DeleteCategory({required this.id});

  @override
  List<Object?> get props => [id];
}