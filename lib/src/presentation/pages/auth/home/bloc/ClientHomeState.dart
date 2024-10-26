import 'package:equatable/equatable.dart';

class ClientHomeState extends Equatable {
  final int pageIndex;
  const ClientHomeState({this.pageIndex = 0});

  ClientHomeState copyWith({int? pageIndex}) {
    return ClientHomeState(pageIndex: pageIndex ?? this.pageIndex);
  }

  @override
  List<Object?> get props => [pageIndex];
}
