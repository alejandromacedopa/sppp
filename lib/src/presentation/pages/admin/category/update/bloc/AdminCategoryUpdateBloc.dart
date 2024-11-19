import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sppp/src/domain/useCases/category/CategoryUseCases.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateEvent.dart';
import 'package:sppp/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateState.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';
class AdminCategoryUpdateBloc extends Bloc<AdminCategoryUpdateEvent, AdminCategoryUpdateState> {

  CategoriesUseCases categoriesUseCases;

  AdminCategoryUpdateBloc(this.categoriesUseCases): super(AdminCategoryUpdateState()) {
    on<AdminCategoryUpdateInitEvent>(_onInitEvent);
    on<NameChanged>(_onNameChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<FormSubmit>(_onFormSubmit);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
    on<ResetForm>(_onResetForm);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(AdminCategoryUpdateInitEvent event, Emitter<AdminCategoryUpdateState> emit) async {
    emit(
        state.copyWith(
            id: event.category?.id,
            name: BlocFormItem(value: event.category?.name ?? ''),
            description: BlocFormItem(value: event.category?.description ?? ''),
            formKey: formKey
        )
    );
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<AdminCategoryUpdateState> emit) async {
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

  Future<void> _onDescriptionChanged(DescriptionChanged event, Emitter<AdminCategoryUpdateState> emit) async {
    emit(
        state.copyWith(
            description: BlocFormItem(
                value: event.description.value,
                error: event.description.value.isNotEmpty ? null : 'Ingresa la descripcion'
            ),
            formKey: formKey
        )
    );
  }

  Future<void> _onPickImage(PickImage event, Emitter<AdminCategoryUpdateState> emit) async {
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

  Future<void> _onTakePhoto(TakePhoto event, Emitter<AdminCategoryUpdateState> emit) async {
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

  Future<void> _onFormSubmit(FormSubmit event, Emitter<AdminCategoryUpdateState> emit) async {
    emit(
        state.copyWith(
            response: Loading(),
            formKey: formKey
        )
    );
    Resource response = await categoriesUseCases.update.run(state.id, state.toCategory(), state.file);
    emit(
        state.copyWith(
            response: response,
            formKey: formKey
        )
    );
  }

  Future<void> _onResetForm(ResetForm event, Emitter<AdminCategoryUpdateState> emit) async {
    emit(state.resetForm());
  }

}