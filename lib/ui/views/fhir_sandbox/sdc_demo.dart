import 'package:faiadashu/faiadashu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sdc_demo_controller.dart';

// spec: https://github.com/tiloc/faiadashu/blob/main/example/lib/questionnaire_launch_tile.dart

class SdcDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SdcDemoController controller = Get.find();

    return QuestionnaireScrollerPage(
      fhirResourceProvider: controller.registryFhirResourceProvider,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
          label: const Text('Save'),
          icon: const Icon(Icons.thumb_up),
          onPressed: () {
            // Generate a response and store it in-memory.
            // In a real-world scenario one would persist or post the response instead.
            controller.saveResponse.call(
                controller.questionnairePath,
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
