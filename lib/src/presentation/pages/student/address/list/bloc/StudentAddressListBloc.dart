import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/models/Address.dart';
import 'package:sppp/src/domain/models/AuthResponse.dart';
import 'package:sppp/src/domain/useCases/address/AddressUseCases.dart';
import 'package:sppp/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListEvent.dart';
import 'package:sppp/src/presentation/pages/student/address/list/bloc/StudentAddressListState.dart';

class StudentAddressListBloc
    extends Bloc<StudentAddressListEvent, StudentAddressListState> {
  final AddressUseCases addressUseCases;
  final AuthUseCases authUseCases;

  StudentAddressListBloc(this.addressUseCases, this.authUseCases)
      : super(StudentAddressListState()) {
    on<GetUserAddress>(_onGetUserAddress);
    on<ChangeRadioValue>(_onChangeRadioValue);
    on<SetAddressSession>(_onSetAddressSession);
    on<DeleteAddress>(_onDeleteAddress);
  }

  Future<void> _onGetUserAddress(
      GetUserAddress event, Emitter<StudentAddressListState> emit) async {
    try {
      emit(state.copyWith(response: Loading()));

      final authResponse = await authUseCases.getUserSession.run();
      if (authResponse?.user.id != null) {
        final response =
        await addressUseCases.getUserAddress.run(authResponse!.user.id!);
        emit(state.copyWith(response: response));
      } else {
        emit(state.copyWith(
            response: Errors(message: 'No se encontró la sesión del usuario.')));
      }
    } catch (e) {
      emit(state.copyWith(
          response: Errors(message: 'Error al cargar las direcciones.')));
    }
  }

  Future<void> _onChangeRadioValue(
      ChangeRadioValue event, Emitter<StudentAddressListState> emit) async {
    emit(state.copyWith(radioValue: event.radioValue));
    try {
      await addressUseCases.saveAddressInSession.run(event.address);
    } catch (e) {
      emit(state.copyWith(
          response: Errors(message: 'No se pudo guardar la dirección en la sesión.')));
    }
  }

  Future<void> _onSetAddressSession(
      SetAddressSession event, Emitter<StudentAddressListState> emit) async {
    try {
      final addressSession = await addressUseCases.getAddressSession.run();

      if (addressSession != null) {
        final index = event.addressList
            .indexWhere((address) => address.id == addressSession.id);

        if (index != -1) {
          emit(state.copyWith(radioValue: index));
        }
      }
    } catch (e) {
      emit(state.copyWith(
          response: Errors(message: 'Error al establecer la dirección en la sesión.')));
    }
  }

  Future<void> _onDeleteAddress(
      DeleteAddress event, Emitter<StudentAddressListState> emit) async {
    try {
      emit(state.copyWith(response: Loading()));

      final response = await addressUseCases.delete.run(event.id);
      if (response is Success) {
        final addressSession = await addressUseCases.getAddressSession.run();
        if (addressSession?.id == event.id) {
          await addressUseCases.deleteFromSession.run();
          emit(state.copyWith(radioValue: null, response: response));
        } else {
          emit(state.copyWith(response: response));
        }
      } else {
        emit(state.copyWith(response: response));
      }
    } catch (e) {
      emit(state.copyWith(
          response: Errors(message: 'Error al eliminar la dirección.')));
    }
  }
}
