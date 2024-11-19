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
import 'package:sppp/src/data/dataSource/remote/services/CategoryServices.dart'
    as _i285;
import 'package:sppp/src/data/dataSource/remote/services/CoursesSercices.dart'
    as _i885;
import 'package:sppp/src/data/dataSource/remote/services/EnterpriseServices.dart'
    as _i1007;
import 'package:sppp/src/data/dataSource/remote/services/RolesServices.dart'
    as _i1025;
import 'package:sppp/src/data/dataSource/remote/services/UsersServices.dart'
    as _i1053;
import 'package:sppp/src/di/AppModule.dart' as _i187;
import 'package:sppp/src/domain/repository/AuthRepository.dart' as _i672;
import 'package:sppp/src/domain/repository/CategoryRepository.dart' as _i440;
import 'package:sppp/src/domain/repository/CoursesRepository.dart' as _i179;
import 'package:sppp/src/domain/repository/EnterpriseRepository.dart' as _i825;
import 'package:sppp/src/domain/repository/RolesRepository.dart' as _i845;
import 'package:sppp/src/domain/repository/UsersRepository.dart' as _i576;
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart' as _i956;
import 'package:sppp/src/domain/useCases/category/CategoryUseCases.dart'
    as _i822;
import 'package:sppp/src/domain/useCases/courses/CoursesUseCases.dart' as _i462;
import 'package:sppp/src/domain/useCases/enterprise/EnterpriseUseCases.dart'
    as _i463;
import 'package:sppp/src/domain/useCases/roles/RolesUseCases.dart' as _i933;
import 'package:sppp/src/domain/useCases/users/UsersUseCases.dart' as _i746;

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
    gh.factory<_i1025.RolesService>(() => appModule.rolesService);
    gh.factory<_i285.CategoriesService>(() => appModule.categoriesService);
    gh.factory<_i885.CoursesService>(() => appModule.coursesService);
    gh.factory<_i1053.UsersServices>(() => appModule.usersServices);
    gh.factory<_i1007.EnterpriseService>(() => appModule.enterpriseService);
    gh.factory<_i672.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i845.RolesRepository>(() => appModule.rolesRepository);
    gh.factory<_i576.UsersRepository>(() => appModule.usersRepository);
    gh.factory<_i440.CategoriesRepository>(
        () => appModule.categoriesRepository);
    gh.factory<_i179.CoursesRepository>(() => appModule.coursesRepository);
    gh.factory<_i825.EnterpriseRepository>(() => appModule.enterpriseRepostory);
    gh.factory<_i956.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i933.RolesUseCases>(() => appModule.rolesUseCases);
    gh.factory<_i746.UsersUseCases>(() => appModule.usersUseCases);
    gh.factory<_i822.CategoriesUseCases>(() => appModule.categoriesUseCases);
    gh.factory<_i462.CoursesUseCases>(() => appModule.coursesUseCases);
    gh.factory<_i463.EnterpriseUseCases>(() => appModule.enterpriseUseCases);
    return this;
  }
}

class _$AppModule extends _i187.AppModule {}
