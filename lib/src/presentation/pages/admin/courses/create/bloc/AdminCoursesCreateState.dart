import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Courses.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class AdminCoursesCreateState extends Equatable {
  final int idCategory;
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem price;
  final GlobalKey<FormState>? formKey;
  File? file1;
  File? file2;
  final Resource? response;

  AdminCoursesCreateState(
      {this.name = const BlocFormItem(error: 'Ingresa el nombre'),
        this.description = const BlocFormItem(error: 'Ingresa la descripcion'),
        this.price = const BlocFormItem(error: 'Ingresa el precio'),
        this.idCategory = 0,
        this.formKey,
        this.response,
        this.file1,
        this.file2});

  toCourses() => Courses(
      name: name.value,
      description: description.value,
      price: double.parse(price.value),
      idCategory: idCategory);

  AdminCoursesCreateState resetForm() {
    return AdminCoursesCreateState(
      name: const BlocFormItem(error: 'Ingresa el nombre'),
      description: const BlocFormItem(error: 'Ingresa la descripcion'),
    );
  }

  AdminCoursesCreateState copyWith(
      {int? idCategory,
        BlocFormItem? name,
        BlocFormItem? description,
        BlocFormItem? price,
        GlobalKey<FormState>? formKey,
        File? file1,
        File? file2,
        Resource? response}) {
    return AdminCoursesCreateState(
        idCategory: idCategory ?? this.idCategory,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        file1: file1 ?? this.file1,
        file2: file2 ?? this.file2,
        formKey: formKey,
        response: response);
  }

  @override
  List<Object?> get props =>
      [idCategory, name, description, price, file1, file2, response];
}