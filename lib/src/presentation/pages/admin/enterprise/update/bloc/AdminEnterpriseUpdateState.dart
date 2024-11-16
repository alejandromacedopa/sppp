import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sppp/src/domain/models/Enterprise.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class AdminEnterpriseUpdateState extends Equatable {

  final int id;
  final BlocFormItem name;
  final BlocFormItem supervisor;
  final GlobalKey<FormState>? formKey;
  File? file;
  final Resource? response;

  AdminEnterpriseUpdateState({
    this.id = 0,
    this.name = const BlocFormItem(error: 'Ingresa el nombre de la empresa'),
    this.supervisor = const BlocFormItem(error: 'Ingrese al supervisor'),
    this.formKey,
    this.response,
    this.file
  });

  toEnterprise() => Enterprise(
    id: id,
    name: name.value,
    supervisor: supervisor.value,
  );

  AdminEnterpriseUpdateState resetForm() {
    return AdminEnterpriseUpdateState(
        file: null
    );
  }

  AdminEnterpriseUpdateState copyWith({
    int? id,
    BlocFormItem? name,
    BlocFormItem? supervisor,
    GlobalKey<FormState>? formKey,
    File? file,
    Resource? response
  }) {
    return AdminEnterpriseUpdateState(
        id: id ?? this.id,
        name: name ?? this.name,
        supervisor: supervisor ?? this.supervisor,
        file: file ?? this.file,
        formKey: formKey,
        response: response
    );
  }

  @override
  List<Object?> get props => [id, name, supervisor, file, response];

}