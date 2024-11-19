import 'package:equatable/equatable.dart';

class AdminHomeState extends Equatable {
  final int pageIndex;
  final bool isLoading;

  const AdminHomeState({
    this.pageIndex = 0,
    this.isLoading = false,
  });

  AdminHomeState copyWith({
    int? pageIndex,
    bool? isLoading,
  }) {
    return AdminHomeState(
      pageIndex: pageIndex ?? this.pageIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [pageIndex, isLoading];
}
