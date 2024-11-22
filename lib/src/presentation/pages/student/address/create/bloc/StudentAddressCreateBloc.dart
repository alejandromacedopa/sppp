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
  final AddressUseCases addressUseCases;
  final AuthUseCases authUseCases;

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
    try {
      AuthResponse? authResponse = await authUseCases.getUserSession.run();
      emit(state.copyWith(formKey: formKey));
      if (authResponse?.user.id != null) {
        emit(state.copyWith(
          formKey: formKey,
          idUser: int.tryParse(authResponse!.user.id!) ?? 0,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
          response: Errors(message: 'Error al cargar la sesión del usuario')));
    }
  }

  Future<void> _onAddressChanged(
      AddressChanged event, Emitter<StudentAddressCreateState> emit) async {
    emit(state.copyWith(
        address: _validateField(event.address.value, 'Ingresa la dirección'),
        formKey: formKey));
  }

  Future<void> _onNeighborhoodChanged(
      NeighborhoodChanged event, Emitter<StudentAddressCreateState> emit) async {
    emit(state.copyWith(
        neighborhood: _validateField(
            event.neighborhood.value, 'Ingresa el barrio'),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<StudentAddressCreateState> emit) async {
    try {
      emit(state.copyWith(response: Loading(), formKey: formKey));
      final response = await addressUseCases.create.run(state.toAddress());
      if (response is Success) {
        emit(state.copyWith(response: response, formKey: formKey));
      } else if (response is Error) {
        emit(state.copyWith(response: response, formKey: formKey));
      }
    } catch (e) {
      emit(state.copyWith(
          response: Errors(message: 'Error al enviar el formulario')));
    }
  }

  BlocFormItem _validateField(String value, String errorMessage) {
    return BlocFormItem(
        value: value, error: value.isNotEmpty ? null : errorMessage);
  }
}
