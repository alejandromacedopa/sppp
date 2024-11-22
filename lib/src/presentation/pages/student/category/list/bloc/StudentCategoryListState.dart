
import 'package:equatable/equatable.dart';
import 'package:sppp/src/domain/utils/Resource.dart';

class StudentCategoryListState extends Equatable{
  final Resource? response;

  const StudentCategoryListState({this.response});

  StudentCategoryListState copyWith({
    Resource? response
  })
  {
    return StudentCategoryListState(response: response);
  }

  @override
  List<Object?> get props => [response];

}