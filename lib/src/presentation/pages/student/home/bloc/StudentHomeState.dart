import 'package:equatable/equatable.dart';

class StudentHomeState extends Equatable {
  final int pageIndex;
  final bool isLoading;

  const StudentHomeState({this.pageIndex = 0, this.isLoading = false,});

  StudentHomeState copyWith({
    int? pageIndex,
    bool? isLoading,
  }) {
    return StudentHomeState(
      pageIndex: pageIndex ?? this.pageIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
  @override
  List<Object?> get props => [pageIndex, isLoading];
}
