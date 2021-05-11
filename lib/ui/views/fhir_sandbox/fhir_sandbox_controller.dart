import 'package:faiadashu/faiadashu.dart';
import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// spec: https://github.com/tiloc/faiadashu/blob/main/example/lib/main.dart

class FhirSandboxController extends GetxController {
  late final FhirResourceProvider resourceBundleProvider;

  final ScrollController listScrollController = ScrollController();

  final Map<String, QuestionnaireResponse?> savedResponses = {};

// Quick-and-dirty in-memory storage for QuestionnaireResponses
// Not suitable for production use.
  void saveResponse(String id, QuestionnaireResponse? response) {
    if (response == null) {
      return;
    }

    savedResponses[id] = response;
  }

// Quick-and-dirty in-memory storage for QuestionnaireResponses
// Not suitable for production use.
  QuestionnaireResponse? restoreResponse(String id) {
    if (savedResponses.containsKey(id)) {
      return savedResponses[id];
    } else {
      return null;
    }
  }

  // Build up a registry of ValueSets and CodeSystems which are being referenced
  // in the questionnaires.
  //
  // It is typically *NOT* possible to resolve value sets through their URI, as
  // these do not point to real web-servers.
  //
  // This mechanism allows to add them from other sources.
  final valueSetProvider = AssetResourceProvider.fromMap(
    <String, String>{
      'http://hl7.org/fhir/ValueSet/administrative-gender':
          'assets/valuesets/fhir_valueset_administrative_gender.json',
      'http://hl7.org/fhir/administrative-gender':
          'assets/codesystems/fhir_codesystem_administrative_gender.json',
      'http://hl7.org/fhir/ValueSet/ucum-bodyweight':
          'assets/valuesets/ucum_bodyweight.json',
    },
  );

  @override
  void onInit() {
    super.onInit();
    resourceBundleProvider = RegistryFhirResourceProvider([
      InMemoryResourceProvider.inMemory(
          subjectResourceUri,
          Patient(id: Id('example123'), name: [
            HumanName(given: ['Amy'], family: 'A-Demo')
          ])),
      AssetImageAttachmentProvider(
          'http://example.org/images', 'assets/images'),
      valueSetProvider
    ]);
  }
}
