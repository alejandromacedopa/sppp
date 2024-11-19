
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Category.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';


class AdminCategoryCreateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem description;
  File? file;
  final Resource? response;

  final GlobalKey<FormState>? formKey;

  AdminCategoryCreateState(
      {this.name =
      const BlocFormItem(error: 'Ingrese el nombre de la categoria'),
        this.description = const BlocFormItem(error: 'Ingrese la descripcion'),
        this.formKey,
        this.response,
        this.file});

  toCategory() => Category(name: name.value, description: description.value);

  AdminCategoryCreateState resetForm(){
    return AdminCategoryCreateState(
        name: const BlocFormItem(error: 'Ingrese el nombre de la categoria'),
        description: const BlocFormItem(error: 'Ingrese la descripcion')
    );

  }

  AdminCategoryCreateState copyWith(
      {BlocFormItem? name,
        BlocFormItem? description,
        GlobalKey<FormState>? formKey,
        File? file,
        Resource? response}) {
    return AdminCategoryCreateState(
        name: name ?? this.name,
        description: description ?? this.description,
        file: file ?? this.file,
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, description, file, response];
}
