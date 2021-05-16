import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultipleChoiceResponse extends StatelessWidget {
  MultipleChoiceResponse(
    this.setAnswer,
    this.answers,
    this.initialAnswer,
    this.linkId,
    this.freeText,
  );

  final Function setAnswer;
  final List<List<String>> answers;
  final List<String> initialAnswer;
  final TextEditingController controller = TextEditingController();
  final String? linkId;
  final Widget? freeText;

  @override
  Widget build(BuildContext context) {
    List<Widget> options = [];
    final choice = <RxBool>[];
    bool _getChoice(int i) => choice[i].value;

    for (var i = 0; i < answers.length; i++) {
      if (answers.isNotEmpty) {
        if (initialAnswer.indexWhere((element) => element == answers[i][0]) ==
            -1) {
          choice.add(false.obs);
        } else {
          choice.add(true.obs);
        }

        options.add(
          Row(
            children: [
              Obx(
                () => Checkbox(
                  value: _getChoice(i),
                  onChanged: (changed) {
                    if (changed ?? false) {
                      setAnswer(answers[i][answers[i].length - 1], linkId);
                    } else {
                      setAnswer(
                          answers[i][answers[i].length - 1], linkId, true);
                    }
                    choice[i].value = changed ?? false;
                  },
                ),
              ),
              Expanded(
                  child: Text(answers[i][0], style: TextStyle(fontSize: 20))),
            ],
          ),
        );
      }
    }
    if (freeText != null) {
      options.add(freeText!);
    }
    return Column(children: options);
  }
}
