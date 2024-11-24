import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/models/Address.dart';
import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:sppp/src/domain/models/MercadoPagoPaymentBody.dart';
import 'package:sppp/src/domain/models/Order.dart';
import 'package:sppp/src/domain/useCases/MercadoPago/MercadoPagoUseCases.dart';
import 'package:sppp/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:sppp/src/domain/useCases/address/AddressUseCases.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/payment/installments/bloc/StudentPaymentInstallmentsEvent.dart';
import 'package:sppp/src/presentation/pages/student/payment/installments/bloc/StudentPaymentInstallmentsState.dart';

class StudentPaymentInstallmentsBloc extends Bloc<StudentPaymentInstallmentsEvent,
    StudentPaymentInstallmentsState> {
  MercadoPagoUseCases mercadoPagoUseCases;
  AuthUseCases authUseCases;
  ShoppingBagUseCases shoppingBagUseCases;
  AddressUseCases addressUseCases;

  StudentPaymentInstallmentsBloc(this.mercadoPagoUseCases, this.authUseCases,
      this.shoppingBagUseCases, this.addressUseCases)
      : super(StudentPaymentInstallmentsState()) {
    on<GetInstallments>(_onGetInstallments);
    on<InstallmentChanged>(_onInstallmentChanged);
    on<FormSubmit>(_onFormSubmit);
  }

  Future<void> _onGetInstallments(GetInstallments event,
      Emitter<StudentPaymentInstallmentsState> emit) async {
    emit(state.copyWith(responseInstallments: Loading()));
    Resource response = await mercadoPagoUseCases.getInstallments
        .run(event.firstSixDigits, event.amount);
    emit(state.copyWith(responseInstallments: response));
  }

  Future<void> _onInstallmentChanged(InstallmentChanged event,
      Emitter<StudentPaymentInstallmentsState> emit) async {
    emit(state.copyWith(installment: event.installment));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<StudentPaymentInstallmentsState> emit) async {
    emit(state.copyWith(responsePayment: Loading()));

    double totalToPay = await shoppingBagUseCases.getTotal.run();
    AuthResponse authResponse = await authUseCases.getUserSession.run();
    Address address = await addressUseCases.getAddressSession.run();
    List<Courses> courses = await shoppingBagUseCases.getCourses.run();

    // Convertir los productos para que `price` sea de tipo int
    List<Courses> sanitizedCourses = courses.map((courses) {
      // Sanitize y convertir price a int
      final coursesJson = courses.toJson();
      coursesJson["price"] =
          coursesJson["price"].toInt(); // Convertir `price` a int
      // Convertir de nuevo el Map a un objeto Product
      return Courses.fromJson(coursesJson);
    }).toList();

    print('id del usuario antes del body: ${authResponse.user.id}');
    MercadoPagoPaymentBody body = MercadoPagoPaymentBody(
        transactionAmount: totalToPay.toInt(),
        token: event.mercadoPagoCardTokenResponse.id,
        installments: int.parse(state.installment!),
        issuerId: event.installments.issuer.id,
        paymentMethodId: event.installments.paymentMethodId,
        payer: Payer(
            email: authResponse.user.email!,
            identification: Identification(
                number: event.mercadoPagoCardTokenResponse.cardholder
                    .identification.number,
                type: event.mercadoPagoCardTokenResponse.cardholder
                    .identification.type)),
        order: Order(
            idClient: authResponse.user.id!,
            idAddress: address.id!,
            courses: sanitizedCourses));
    print('id del usuario despues del body: ${authResponse.user.id}');
    Resource responsePayment =
    await mercadoPagoUseCases.createPaymentUseCase.run(body);
    emit(state.copyWith(responsePayment: responsePayment));
  }
}