import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sppp/src/domain/useCases/enterprise/EnterpriseUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/bloc/AdminEnterpriseUpdateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/update/bloc/AdminEnterpriseUpdateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class AdminEnterpriseUpdateBloc extends Bloc<AdminEnterpriseUpdateEvent, AdminEnterpriseUpdateState> {

  EnterpriseUseCases enterpriseUseCases;

  AdminEnterpriseUpdateBloc(this.enterpriseUseCases): super(AdminEnterpriseUpdateState()) {
    on<AdminEnterpriseUpdateInitEvent>(_onInitEvent);
    on<NameChanged>(_onNameChanged);
    on<SupervisorChanged>(_onSupervisorChanged);
    on<FormSubmit>(_onFormSubmit);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
    on<ResetForm>(_onResetForm);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(AdminEnterpriseUpdateInitEvent event, Emitter<AdminEnterpriseUpdateState> emit) async {
    emit(
        state.copyWith(
            id: event.enterprise?.id,
            name: BlocFormItem(value: event.enterprise?.name ?? ''),
            supervisor: BlocFormItem(value: event.enterprise?.supervisor ?? ''),
            formKey: formKey
        )
    );
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<AdminEnterpriseUpdateState> emit) async {
    emit(
        state.copyWith(
            name: BlocFormItem(
                value: event.name.value,
                error: event.name.value.isNotEmpty ? null : 'Ingresa el nombre'
            ),
            formKey: formKey
        )
    );
  }

  Future<void> _onSupervisorChanged(SupervisorChanged event, Emitter<AdminEnterpriseUpdateState> emit) async {
    emit(
        state.copyWith(
            supervisor: BlocFormItem(
                value: event.supervisor.value,
                error: event.supervisor.value.isNotEmpty ? null : 'Ingresa la descripcion'
            ),
            formKey: formKey
        )
    );
  }

  Future<void> _onPickImage(PickImage event, Emitter<AdminEnterpriseUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(
          state.copyWith(
              file: File(image.path),
              formKey: formKey
          )
      );
    }
  }

  Future<void> _onTakePhoto(TakePhoto event, Emitter<AdminEnterpriseUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(
          state.copyWith(
              file: File(image.path),
              formKey: formKey
          )
      );
    }
  }

  Future<void> _onFormSubmit(FormSubmit event, Emitter<AdminEnterpriseUpdateState> emit) async {
    emit(
        state.copyWith(
            response: Loading(),
            formKey: formKey
        )
    );
    Resource response = await enterpriseUseCases.update.run(state.id, state.toEnterprise(), state.file);
    emit(
        state.copyWith(
            response: response,
            formKey: formKey
        )
    );
  }

  Future<void> _onResetForm(ResetForm event, Emitter<AdminEnterpriseUpdateState> emit) async {
    emit(state.resetForm());
  }

}