import 'package:amia_flutter_103/ui/views/fhir_sandbox/fhir_sandbox_controller.dart';
import 'package:faiadashu/faiadashu.dart';
import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// spec: https://github.com/tiloc/faiadashu/blob/main/example/lib/questionnaire_launch_tile.dart

class SdcDemo extends StatelessWidget {
  late final String questionnairePath;
  late final FhirResourceProvider fhirResourceProvider;
  late final void Function(
          String id, QuestionnaireResponse? questionnaireResponse)
      saveResponseFunction;
  late final QuestionnaireResponse? Function(String id) restoreResponseFunction;

  @override
  Widget build(BuildContext context) {
    final FhirSandboxController controller = Get.find();

    fhirResourceProvider = controller.resourceBundleProvider;
    questionnairePath = 'assets/fhir/sdc_demo.json';
    saveResponseFunction = controller.saveResponse;
    restoreResponseFunction = controller.restoreResponse;

    return QuestionnaireScrollerPage(
      fhirResourceProvider: RegistryFhirResourceProvider([
        AssetResourceProvider.singleton(
            questionnaireResourceUri, questionnairePath),
        InMemoryResourceProvider.inMemory(questionnaireResponseResourceUri,
            restoreResponseFunction(questionnairePath)),
        fhirResourceProvider
      ]),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
          label: const Text('Save'),
          icon: const Icon(Icons.thumb_up),
          onPressed: () {
            // Generate a response and store it in-memory.
            // In a real-world scenario one would persist or post the response instead.
            saveResponseFunction.call(
                questionnairePath,
                QuestionnaireFiller.of(context)
                    .aggregator<QuestionnaireResponseAggregator>()
                    .aggregate());
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Survey saved.')));
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
