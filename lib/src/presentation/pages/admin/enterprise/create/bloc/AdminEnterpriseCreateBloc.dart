import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sppp/src/domain/useCases/enterprise/EnterpriseUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/enterprise/create/bloc/AdminEnterpriseCreateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class AdminEnterpriseCreateBloc extends Bloc<AdminEnterpriseCreateEvent, AdminEnterpriseCreateState> {
  EnterpriseUseCases enterpriseUseCases;

  AdminEnterpriseCreateBloc(this.enterpriseUseCases) : super(AdminEnterpriseCreateState()) {
    on<AdminEnterpriseCreateInitEvent>(_onInitEvent);
    on<NameChanged>(_onNameChanged);
    on<SupervisorChanged>(_onSupervisorChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(AdminEnterpriseCreateInitEvent event, Emitter<AdminEnterpriseCreateState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<AdminEnterpriseCreateState> emit) async {
    final newValue = event.name.value ?? ''; // Usa una cadena vacía si el valor es nulo
    emit(state.copyWith(
      name: BlocFormItem(
        value: newValue,
        error: newValue.isNotEmpty ? null : 'Ingresa el nombre de la empresa',
      ),
      formKey: formKey,
    ));
  }

  Future<void> _onSupervisorChanged(SupervisorChanged event, Emitter<AdminEnterpriseCreateState> emit) async {
    emit(state.copyWith(
      supervisor: BlocFormItem(
        value: event.supervisor.value,
        error: event.supervisor.value.isNotEmpty ? null : 'Ingresa supervisor',
      ),
      formKey: formKey,
    ));
  }

  Future<void> _onPickImage(PickImage event, Emitter<AdminEnterpriseCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onTakePhoto(TakePhoto event, Emitter<AdminEnterpriseCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onFormSubmit(FormSubmit event, Emitter<AdminEnterpriseCreateState> emit) async {
    if (state.name.value == null || state.name.value!.isEmpty) {
      emit(state.copyWith(
          name: BlocFormItem(value: state.name.value, error: 'El nombre no debe estar vacío')
      ));
      return;
    }

    emit(state.copyWith(response: Loading(), formKey: formKey));
    Resource response = await enterpriseUseCases.create.run(state.toEnterprise(), state.file!);
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onResetForm(ResetForm event, Emitter<AdminEnterpriseCreateState> emit) async {
    emit(state.resetForm());
  }
}
