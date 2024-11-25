import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/evidences/EvidenceUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/evidences/create/bloc/AdminEvidenceCreateEvent.dart';
import 'package:sppp/src/presentation/pages/student/evidences/create/bloc/AdminEvidenceCreateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class AdminEvidenceCreateBloc extends Bloc<
    AdminEvidenceCreateEvent, AdminEvidenceCreateState> {
  EvidenceUseCases evidenceUseCases;

  AdminEvidenceCreateBloc(this.evidenceUseCases)
      : super(AdminEvidenceCreateState()) {
    on<AdminEvidenceCreateInitEvent>(_onInitEvent);
    on<NameChanged>(_onNameChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<EvidenceLinkChanged>(_onEvidenceLinkChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
  }

  Future<void> _onInitEvent(AdminEvidenceCreateInitEvent event,
      Emitter<AdminEvidenceCreateState> emit) async {
    emit(state.copyWith(formKey: GlobalKey<FormState>()));
  }

  Future<void> _onNameChanged(NameChanged event,
      Emitter<AdminEvidenceCreateState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty
                ? null
                : 'Ingresa el nombre de la evidencia')));
  }

  Future<void> _onDescriptionChanged(DescriptionChanged event,
      Emitter<AdminEvidenceCreateState> emit) async {
    emit(state.copyWith(
        description: BlocFormItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'Ingresa la descripción de la evidencia')));
  }

  Future<void> _onEvidenceLinkChanged(EvidenceLinkChanged event,
      Emitter<AdminEvidenceCreateState> emit) async {
    emit(state.copyWith(
        evidenceLink: BlocFormItem(
            value: event.evidenceLink.value,
            error: event.evidenceLink.value.isNotEmpty
                ? null
                : 'Ingresa un enlace válido')));
  }

  Future<void> _onFormSubmit(FormSubmit event,
      Emitter<AdminEvidenceCreateState> emit) async {
    emit(state.copyWith(response: Loading())); // Muestra el estado de carga
    try {
      Resource response = await evidenceUseCases.create.run(state.toEvidence());
      emit(state.copyWith(response: response));
    } catch (e) {
      emit(state.copyWith(response: Error(e.toString())));
    }
  }

  Future<void> _onResetForm(ResetForm event,
      Emitter<AdminEvidenceCreateState> emit) async {
    emit(state.resetForm());
  }
}
