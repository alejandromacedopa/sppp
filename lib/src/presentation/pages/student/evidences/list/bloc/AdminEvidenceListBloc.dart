import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/domain/useCases/evidences/EvidenceUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/student/evidences/list/bloc/AdminEvidenceListEvent.dart';
import 'package:sppp/src/presentation/pages/student/evidences/list/bloc/AdminEvidenceListState.dart';

class AdminEvidenceListBloc
    extends Bloc<AdminEvidenceListEvent, AdminEvidenceListState> {
  final EvidenceUseCases evidenceUseCases;

  AdminEvidenceListBloc(this.evidenceUseCases)
      : super(AdminEvidenceListState()) {
    on<GetEvidences>(_onGetEvidences);
    on<DeleteEvidence>(_onDeleteEvidence);
  }

  Future<void> _onGetEvidences(
      GetEvidences event, Emitter<AdminEvidenceListState> emit) async {
    emit(state.copyWith(response: Loading()));
    try {
      // Obtener las evidencias
      Resource response = await evidenceUseCases.getEvidences.run();
      emit(state.copyWith(response: response));
    } catch (e) {
      emit(state.copyWith(response: Error('Error al obtener evidencias: $e')));
    }
  }

  Future<void> _onDeleteEvidence(
      DeleteEvidence event, Emitter<AdminEvidenceListState> emit) async {
    emit(state.copyWith(response: Loading()));
    try {
      Resource response = await evidenceUseCases.delete.run(event.id);
      emit(state.copyWith(response: response));
    } catch (e) {
      emit(state.copyWith(
          response: Error('Error al eliminar la evidencia: $e')));
    }
  }
}
