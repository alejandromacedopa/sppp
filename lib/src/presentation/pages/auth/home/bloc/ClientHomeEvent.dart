import 'package:equatable/equatable.dart';

abstract class ClientHomeEvent extends Equatable {
  const ClientHomeEvent();

  @override
  List<Object?> get props => [];
}

class ClientChangeDrawerPage extends ClientHomeEvent {
  final int pageIndex;
  const ClientChangeDrawerPage({required this.pageIndex});
  @override
  List<Object?> get props => [pageIndex];
}

class ClientLogout extends ClientHomeEvent {
  const ClientLogout();
}
