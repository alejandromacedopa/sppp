import 'package:equatable/equatable.dart';

abstract class StudentHomeEvent extends Equatable {
  const StudentHomeEvent();

  @override
  List<Object?> get props => [];
}

class StudentChangeDrawerPage extends StudentHomeEvent {
  final int pageIndex;
  const StudentChangeDrawerPage({required this.pageIndex});
  @override
  List<Object?> get props => [pageIndex];
}

class StudentLogout extends StudentHomeEvent {
  const StudentLogout();
}
