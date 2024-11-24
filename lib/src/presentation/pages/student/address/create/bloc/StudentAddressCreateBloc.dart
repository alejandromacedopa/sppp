import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/domain/useCases/address/AddressUseCases.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/address/create/bloc/StudentAddressCreateEvent.dart';
import 'package:sppp/src/presentation/pages/student/address/create/bloc/StudentAddressCreateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class StudentAddressCreateBloc
    extends Bloc<StudentAddressCreateEvent, StudentAddressCreateState> {
  AddressUseCases addressUseCases;
  AuthUseCases authUseCases;

  StudentAddressCreateBloc(this.addressUseCases, this.authUseCases)
      : super(StudentAddressCreateState()) {
    on<StudentAddressCreateInitEvent>(_onClientAddressCreateInitEvent);
    on<AddressChanged>(_onAddressChanged);
    on<NeighborhoodChanged>(_onNeighborhoodChanged);
    on<FormSubmit>(_onFormSubmit);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onClientAddressCreateInitEvent(
      StudentAddressCreateInitEvent event,
      Emitter<StudentAddressCreateState> emit) async {
    AuthResponse? authResponse = await authUseCases.getUserSession.run();
    emit(state.copyWith(formKey: formKey));
    if (authResponse != null) {
      String? userId = authResponse.user.id;
      emit(state.copyWith(formKey: formKey, idUser: userId));
    }
  }


  Future<void> _onAddressChanged(
      AddressChanged event, Emitter<StudentAddressCreateState> emit) async {
    emit(state.copyWith(
        address: BlocFormItem(
            value: event.address.value,
            error:
            event.address.value.isNotEmpty ? null : 'Ingresa la direccion'),
        formKey: formKey));
  }

  Future<void> _onNeighborhoodChanged(
      NeighborhoodChanged event, Emitter<StudentAddressCreateState> emit) async {
    emit(state.copyWith(
        neighborhood: BlocFormItem(
            value: event.neighborhood.value,
            error: event.neighborhood.value.isNotEmpty
                ? null
                : 'Ingresa el barrio'),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<StudentAddressCreateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    Resource response = await addressUseCases.create.run(state.toAddress());
    emit(state.copyWith(response: response, formKey: formKey));
  }
}