import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sppp/src/domain/models/Evidence.dart';
import 'package:sppp/src/domain/utils/Resource.dart';
import 'package:sppp/src/presentation/utils/BlocFormItem.dart';

class AdminEvidenceCreateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem evidenceLink;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  AdminEvidenceCreateState({
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.description = const BlocFormItem(error: 'Ingresa la descripción'),
    this.evidenceLink = const BlocFormItem(error: 'Ingresa un enlace'),
    this.formKey,
    this.response,
  });

  Evidence toEvidence() => Evidence(
      name: name.value,
      description: description.value,
      evidenceLink: evidenceLink.value);

  AdminEvidenceCreateState resetForm() {
    return AdminEvidenceCreateState();
  }

  AdminEvidenceCreateState copyWith({
    BlocFormItem? name,
    BlocFormItem? description,
    BlocFormItem? evidenceLink,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return AdminEvidenceCreateState(
      name: name ?? this.name,
      description: description ?? this.description,
      evidenceLink: evidenceLink ?? this.evidenceLink,
      formKey: formKey ?? this.formKey,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [name, description, evidenceLink, response];
}
