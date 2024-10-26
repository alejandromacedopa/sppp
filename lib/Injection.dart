import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sppp/Injection.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencias() async => await locator.init();
