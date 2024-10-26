// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sppp/src/data/dataSource/local/SharedPref.dart' as _i940;
import 'package:sppp/src/data/dataSource/remote/services/AuthServices.dart'
    as _i353;
import 'package:sppp/src/data/dataSource/remote/services/RolesServices.dart'
    as _i1025;
import 'package:sppp/src/di/AppModule.dart' as _i187;
import 'package:sppp/src/domain/repository/AuthRepository.dart' as _i672;
import 'package:sppp/src/domain/repository/RolesRepository.dart' as _i845;
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart' as _i956;
import 'package:sppp/src/domain/useCases/roles/RolesUseCases.dart' as _i933;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i940.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i353.AuthServices>(() => appModule.authServices);
    gh.factory<_i672.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i956.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i1025.RolesService>(() => appModule.rolesService);
    gh.factory<_i845.RolesRepository>(() => appModule.rolesRepository);
    gh.factory<_i933.RolesUseCases>(() => appModule.rolesUseCases);
    return this;
  }
}

class _$AppModule extends _i187.AppModule {}
