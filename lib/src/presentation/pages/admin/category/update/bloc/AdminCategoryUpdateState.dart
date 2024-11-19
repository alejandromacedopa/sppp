import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';


class AdminCategoryUpdateState extends Equatable {

  final int id;
  final BlocFormItem name;
  final BlocFormItem description;
  final GlobalKey<FormState>? formKey;
  File? file;
  final Resource? response;

  AdminCategoryUpdateState({
    this.id = 0,
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.description = const BlocFormItem(error: 'Ingresa la descripcion'),
    this.formKey,
    this.response,
    this.file
  });

  toCategory() => Category(
    id: id,
    name: name.value,
    description: description.value,
  );

  AdminCategoryUpdateState resetForm() {
    return AdminCategoryUpdateState(
        file: null
    );
  }

  AdminCategoryUpdateState copyWith({
    int? id,
    BlocFormItem? name,
    BlocFormItem? description,
    GlobalKey<FormState>? formKey,
    File? file,
    Resource? response
  }) {
    return AdminCategoryUpdateState(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        file: file ?? this.file,
        formKey: formKey,
        response: response
    );
  }

  @override
  List<Object?> get props => [id, name, description, file, response];

}
