import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class AdminEnterpriseCreateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem supervisor;
  File? file;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  AdminEnterpriseCreateState({
    this.name = const BlocFormItem(error: 'Ingrese el nombre de la empresa'),
    this.supervisor = const BlocFormItem(error: 'Ingrese el supervisor'),
    this.formKey,
    this.response,
    this.file,
  });

  toEnterprise() => Enterprise(name: name.value, supervisor: supervisor.value);

  AdminEnterpriseCreateState resetForm() {
    return AdminEnterpriseCreateState(
      name: const BlocFormItem(error: 'Ingrese el nombre de la empresa'),
      supervisor: const BlocFormItem(error: 'Ingrese el supervisor'),
    );
  }

  AdminEnterpriseCreateState copyWith({
    BlocFormItem? name, supervisor,
    GlobalKey<FormState>? formKey,
    File? file,
    Resource? response,
  }) {
    return AdminEnterpriseCreateState(
      name: name ?? this.name,
      supervisor: supervisor ?? this.supervisor,
      file: file ?? this.file,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [name, supervisor, file, response];
}
