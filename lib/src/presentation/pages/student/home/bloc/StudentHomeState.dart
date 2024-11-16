import 'package:equatable/equatable.dart';

class StudentHomeState extends Equatable {
  final int pageIndex;
  const StudentHomeState({this.pageIndex = 0});

  StudentHomeState copyWith({int? pageIndex}) {
    return StudentHomeState(pageIndex: pageIndex ?? this.pageIndex);
  }

  @override
  List<Object?> get props => [pageIndex];
}
