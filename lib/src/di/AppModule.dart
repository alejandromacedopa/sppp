import 'package:injectable/injectable.dart';
import 'package:sppp/src/data/dataSource/local/SharedPref.dart';
import 'package:sppp/src/data/dataSource/remote/services/AddressService.dart';
import 'package:sppp/src/data/dataSource/remote/services/AuthServices.dart';
import 'package:sppp/src/data/dataSource/remote/services/CategoryServices.dart';
import 'package:sppp/src/data/dataSource/remote/services/CoursesSercices.dart';
import 'package:sppp/src/data/dataSource/remote/services/EnterpriseServices.dart';
import 'package:sppp/src/data/dataSource/remote/services/MercadoPagoService.dart';
import 'package:sppp/src/data/dataSource/remote/services/OrderServices.dart';
import 'package:sppp/src/data/dataSource/remote/services/RolesServices.dart';
import 'package:sppp/src/data/dataSource/remote/services/UsersServices.dart';
import 'package:sppp/src/data/repository/AddressRepositoryImpl.dart';
import 'package:sppp/src/data/repository/AuthRepositoryImpl.dart';
import 'package:sppp/src/data/repository/CategoryRepositoryImpl.dart';
import 'package:sppp/src/data/repository/CoursesRepositoryImpl.dart';
import 'package:sppp/src/data/repository/EnterpriseRepositoryImpl.dart';
import 'package:sppp/src/data/repository/MercadoPagoRepositoryImpl.dart';
import 'package:sppp/src/data/repository/OrderRepositoryImpl.dart';
import 'package:sppp/src/data/repository/RolesRepositoryImpl.dart';
import 'package:sppp/src/data/repository/ShoppingBagRepositoryImpl.dart';
import 'package:sppp/src/data/repository/UsersRepositoryImpl.dart';
import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/domain/models/ShoppingBagRepository.dart';
import 'package:sppp/src/domain/repository/AddressRepository.dart';
import 'package:sppp/src/domain/repository/AuthRepository.dart';
import 'package:sppp/src/domain/repository/CategoryRepository.dart';
import 'package:sppp/src/domain/repository/CoursesRepository.dart';
import 'package:sppp/src/domain/repository/EnterpriseRepository.dart';
import 'package:sppp/src/domain/repository/MercadoPagoRepository.dart';
import 'package:sppp/src/domain/repository/OrderRepository.dart';
import 'package:sppp/src/domain/repository/RolesRepository.dart';
import 'package:sppp/src/domain/repository/UsersRepository.dart';
import 'package:sppp/src/domain/useCases/MercadoPago/CreateCardTokenUseCase.dart';
import 'package:sppp/src/domain/useCases/MercadoPago/CreatePaymentUseCase.dart';
import 'package:sppp/src/domain/useCases/MercadoPago/GetIdentificationTypesUseCase.dart';
import 'package:sppp/src/domain/useCases/MercadoPago/GetInstallmentsUseCase.dart';
import 'package:sppp/src/domain/useCases/MercadoPago/MercadoPagoUseCases.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/AddShoppingBagUseCase.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/GetCoursesShoppingBagUseCase.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/GetTotalShoppingBagUseCase.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:sppp/src/domain/useCases/address/AddressUseCases.dart';
import 'package:sppp/src/domain/useCases/address/CreateAddressUseCase.dart';
import 'package:sppp/src/domain/useCases/address/DeleteAddressFromSessionUseCase.dart';
import 'package:sppp/src/domain/useCases/address/DeleteAddressUseCase.dart';
import 'package:sppp/src/domain/useCases/address/GetAddressSessionUseCase.dart';
import 'package:sppp/src/domain/useCases/address/GetUserAddressUseCase.dart';
import 'package:sppp/src/domain/useCases/address/SaveAddressInSessionUseCase.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:sppp/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:sppp/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:sppp/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:sppp/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:sppp/src/domain/useCases/category/CategoryUseCases.dart';
import 'package:sppp/src/domain/useCases/category/CreateCategoryUseCase.dart';
import 'package:sppp/src/domain/useCases/category/DeleteCategoryUseCase.dart';
import 'package:sppp/src/domain/useCases/category/GetCategoryUseCase.dart';
import 'package:sppp/src/domain/useCases/category/UpdateCategoryUseCase.dart';
import 'package:sppp/src/domain/useCases/courses/CoursesUseCases.dart';
import 'package:sppp/src/domain/useCases/courses/CreateCoursesUseCase.dart';
import 'package:sppp/src/domain/useCases/courses/DeleteCoursesUseCase.dart';
import 'package:sppp/src/domain/useCases/courses/GetCoursesByCategoryUseCase.dart';
import 'package:sppp/src/domain/useCases/courses/UpdateCoursesUseCase.dart';
import 'package:sppp/src/domain/useCases/enterprise/CreateEnterpriseUseCase.dart';
import 'package:sppp/src/domain/useCases/enterprise/DeleteEnterpriseUseCase.dart';
import 'package:sppp/src/domain/useCases/enterprise/EnterpriseUseCases.dart';
import 'package:sppp/src/domain/useCases/enterprise/GetEnterpriseUseCases.dart';
import 'package:sppp/src/domain/useCases/enterprise/UpdateEnterpriseUseCase.dart';
import 'package:sppp/src/domain/useCases/orders/GetOrdersSessionUseCase.dart';
import 'package:sppp/src/domain/useCases/orders/GetUserOrdersUseCase.dart';
import 'package:sppp/src/domain/useCases/orders/OrdersUseCases.dart';
import 'package:sppp/src/domain/useCases/orders/SaveAddressInSessionUseCase.dart';
import 'package:sppp/src/domain/useCases/roles/CreateRolesUseCase.dart';
import 'package:sppp/src/domain/useCases/roles/GetRolesUseCases.dart';
import 'package:sppp/src/domain/useCases/roles/RolesUseCases.dart';
import 'package:sppp/src/domain/useCases/users/DeleteUsersUseCase.dart';
import 'package:sppp/src/domain/useCases/users/GetUsersUseCase.dart';
import 'package:sppp/src/domain/useCases/users/UsersUseCases.dart';

@module
abstract class AppModule {
  //SHARED PREFERENCES
  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  Future<String> get token async {
    String token = "";
    final userSession = await sharedPref.read('user');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }
    return token;
  }

  //SERVICE
  @injectable
  AuthServices get authServices => AuthServices();

  @injectable
  RolesService get rolesService => RolesService(token);

  @injectable
  CategoriesService get categoriesService => CategoriesService(token);

  @injectable
  CoursesService get coursesService => CoursesService(token);

  @injectable
  UsersServices get usersServices => UsersServices(token);

  @injectable
  EnterpriseService get enterpriseService => EnterpriseService(token);

  @injectable
  AddressService get addressService => AddressService(token);

  @injectable
  MercadoPagoService get mercadoPagoService => MercadoPagoService(token);

  @injectable
  OrderService get orderService => OrderService(token);

  //REPOSITORY
  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authServices, sharedPref);

  @injectable
  RolesRepository get rolesRepository => RolesRepositoryImpl(rolesService);

  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(usersServices);

  @injectable
  CategoriesRepository get categoriesRepository =>
      CategoriesRepositoryImpl(categoriesService);

  @injectable
  CoursesRepository get coursesRepository =>
      CoursesRepositoryImpl(coursesService);

  @injectable
  EnterpriseRepository get enterpriseRepostory =>
      EnterpriseRepositoryimpl(enterpriseService);

  @injectable
  OrderRepository get orderRepository =>
      OrderRepositoryImpl(orderService, sharedPref);

  @injectable
  AddressRepository get addressRepository =>
      AddressRepositoryImpl(addressService, sharedPref);

  @injectable
  ShoppingBagRepository get shoppingBagRepository =>
      ShoppingBagRepositoryImpl(sharedPref);

  @injectable
  MercadoPagoRepository get mercadoPagoRepository =>
      MercadoPagoRepositoryImpl(mercadoPagoService);

  //USECASES
  @injectable
  AuthUseCases get authUseCases =>
      AuthUseCases(
          login: LoginUseCase(authRepository),
          register: RegisterUseCase(authRepository),
          getUserSession: GetUserSessionUseCase(authRepository),
          saveUserSession: SaveUserSessionUseCase(authRepository),
          logout: LogoutUseCase(authRepository));


  @injectable
  RolesUseCases get rolesUseCases =>
      RolesUseCases(
          create: CreateRolesUseCase(rolesRepository),
          getRoles: GetRolesUseCase(rolesRepository));

  @injectable
  UsersUseCases get usersUseCases =>
      UsersUseCases(
          getUsers: GetUsersUseCase(usersRepository),
          delete: DeleteUsersUseCase(usersRepository));

  @injectable
  CategoriesUseCases get categoriesUseCases =>
      CategoriesUseCases(
          create: CreateCategoriesUseCase(categoriesRepository),
          getCategories: GetCategoriesUseCase(categoriesRepository),
          update: UpdateCategoriesUseCase(categoriesRepository),
          delete: DeleteCategoriesUseCase(categoriesRepository));

  @injectable
  CoursesUseCases get coursesUseCases =>
      CoursesUseCases(
          create: CreateCoursesUseCase(coursesRepository),
          getCoursesByCategory: GetCoursesByCategoryUseCase(coursesRepository),
          update: UpdateCoursesUseCase(coursesRepository),
          delete: DeleteCoursesUseCase(coursesRepository));

  @injectable
  EnterpriseUseCases get enterpriseUseCases =>
      EnterpriseUseCases(
          create: CreateEnterpriseUseCase(enterpriseRepostory),
          getEnterprise: GetEnterpriseUseCase(enterpriseRepostory),
          update: UpdateEnterpriseUseCase(enterpriseRepostory),
          delete: DeleteEnterpriseUseCase(enterpriseRepostory));

  @injectable
  ShoppingBagUseCases get shoppingBagUseCases =>
      ShoppingBagUseCases(
          add: AddShoppingBagUseCase(shoppingBagRepository),
          getCourses: GetCoursesShoppingBagUseCase(shoppingBagRepository),
          deleteItem: DeleteItemShoppinBagUseCase(shoppingBagRepository),
          deleteShoppingBag: deleteShoppingBagUseCase(shoppingBagRepository),
          getTotal: GetTotalShoppingBagUseCase(shoppingBagRepository));

  @injectable
  AddressUseCases get addressUseCases =>
      AddressUseCases(
          create: CreateAddressUseCase(addressRepository),
          getUserAddress: GetUserAddressUseCase(addressRepository),
          saveAddressInSession: SaveAddressInSessionUseCase(addressRepository),
          getAddressSession: GetAddressSessionUseCase(addressRepository),
          delete: DeleteAddressUseCase(addressRepository),
          deleteFromSession: DeleteAddressFromSessionUseCase(
              addressRepository));

  @injectable
  OrdersUseCases get ordersUseCases => OrdersUseCases(
      getUserOrders: GetUserOrdersUseCase(orderRepository),
      saveOrdersInSession: SaveOrdersInSessionUseCase(orderRepository),
      getOrdersSession: GetOrdersSessionUseCase(orderRepository));


  @injectable
  MercadoPagoUseCases get mercadoPagoUseCases => MercadoPagoUseCases(
      getIdentificationTypes:
      GetIdentificationTypesUseCase(mercadoPagoRepository),
      createCardToken: CreateCardTokenUseCase(mercadoPagoRepository),
      getInstallments: GetInstallmentsUseCase(mercadoPagoRepository),
      createPaymentUseCase: CreatePaymentUseCase(mercadoPagoRepository));
}








