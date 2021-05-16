import 'package:amia_flutter_103/ui/views/fhir_sandbox/fhir_demo/shared/controllers/survey_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'display_question.dart';
import 'percent_indicator.dart';

/// Base class for displaying the particular survey in question
class SurveyView extends StatelessWidget {
  final controller = Get.put(SurveyController());

  @override
  Widget build(BuildContext context) {
    // Questionnaire.fromJson();
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blue[200],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// displays the indicators of completion at the top
                  PercentIndicator(
                    controller.index,
                    controller.totalScreens,
                    controller.percentComplete,
                  ),

                  Container(height: Get.height * .02),

                  /// displays the question and answer options
                  DisplayQuestion(),

                  Container(height: Get.height * .02),

                  /// Navigation buttons to go forward or back in the questions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () => controller.back(),
                          child: Text('Back', style: TextStyle(fontSize: 24))),
                      ElevatedButton(
                          onPressed: () =>
                              print(controller.getResponse.toJson()),
                          child: Text('Print', style: TextStyle(fontSize: 24))),
                      ElevatedButton(
                          onPressed: () => controller.next(),
                          child: Text('Next', style: TextStyle(fontSize: 24))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
