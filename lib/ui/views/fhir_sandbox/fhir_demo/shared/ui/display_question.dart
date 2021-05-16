import 'package:amia_flutter_103/ui/views/fhir_sandbox/fhir_demo/shared/controllers/survey_controller.dart';
import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'responses/responses.dart';

class DisplayQuestion extends StatelessWidget {
  final SurveyController controller = Get.find();

  StatelessWidget _byType() {
    switch (controller.type) {
      case QuestionnaireItemType.choice:
        {
          if (controller.multipleChoice) {
            return MultipleChoiceResponse(
              controller.setCurrentAnswer,
              controller.choiceResponses,
              controller.initial,
              controller.linkId,
              null,
            );
          } else {
            return SingleChoiceResponse(
              controller.setCurrentAnswer,
              controller.choiceResponses,
              controller.initial,
              controller.linkId,
              null,
              controller.questionnaireItemControl,
            );
          }
        }
      case QuestionnaireItemType.open_choice:
        {
          if (controller.multipleChoice) {
            return MultipleChoiceResponse(
              controller.setCurrentAnswer,
              controller.choiceResponses,
              controller.initial,
              controller.linkId,
              null,
            );
          } else {
            return SingleChoiceResponse(
              controller.setCurrentAnswer,
              controller.choiceResponses,
              controller.initial,
              controller.linkId,
              null,
              controller.questionnaireItemControl,
            );
          }
        }

      case QuestionnaireItemType.string:
        return StringResponse(
          controller.setCurrentAnswer,
          controller.initial,
          controller.linkId,
        );

      case QuestionnaireItemType.text:
        return TextResponse(
          controller.setCurrentAnswer,
          controller.initial,
          controller.linkId,
          controller.text,
        );

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: controller.type == QuestionnaireItemType.group
                ? Center(
                    child: Text(
                    controller.text,
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ))
                : Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: Get.height * .03),
                        Text(controller.groupText,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Container(height: Get.height * .03),
                        Text(controller.text,
                            style: const TextStyle(fontSize: 24)),
                        Expanded(
                          child: Scrollbar(
                            isAlwaysShown: true,
                            child: SingleChildScrollView(
                              child: _byType(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      );
}
