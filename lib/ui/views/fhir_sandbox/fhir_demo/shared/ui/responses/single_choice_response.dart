import 'package:amia_flutter_103/ui/views/fhir_sandbox/fhir_demo/shared/_internal/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleChoiceResponse extends StatelessWidget {
  SingleChoiceResponse(
    this.setAnswer,
    this.answers,
    this.initialAnswer,
    this.linkId,
    this.freeText,
    this.itemControl,
  );

  final Function setAnswer;
  final List<List<String>> answers;
  final List<String> initialAnswer;
  final TextEditingController controller = TextEditingController();
  final String? linkId;
  final Widget? freeText;
  final ItemControl? itemControl;

  //   dropDown: ItemControl.drop_down,
  // slider: ItemControl.slider,

  @override
  Widget build(BuildContext context) {
    List<Widget> options = [];
    final Rx<int> choice = Rx<int>(
      answers.indexWhere((element) =>
          initialAnswer.isEmpty ? false : element[0] == initialAnswer[0]),
    );

    switch (itemControl) {
      case ItemControl.drop_down:
        {}
        break;
      case ItemControl.check_box:
        {
          var _checked = List<bool>.filled(answers.length, false).obs;
          for (var i = 0; i < answers.length; i++) {
            if (answers.isNotEmpty) {
              options.add(
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: _checked[i],
                        onChanged: (changed) {
                          if (changed ?? false) {
                            setAnswer(
                                answers[i][answers[i].length - 1], linkId);
                          } else {
                            setAnswer(answers[i][answers[i].length - 1], linkId,
                                true);
                          }
                          _checked.clear();
                          _checked
                              .addAll(List<bool>.filled(answers.length, false));
                          _checked[i] = true;
                        },
                      ),
                    ),
                    Expanded(
                        child: Text(answers[i][0],
                            style: TextStyle(fontSize: 20))),
                  ],
                ),
              );
            }
          }
          if (freeText != null) {
            options.add(freeText!);
          }
        }
        break;
      case ItemControl.radio_button:
        {
          for (var i = 0; i < answers.length; i++) {
            if (answers.isNotEmpty) {
              options.add(
                Obx(
                  () => RadioListTile(
                    title: Text(answers[i][0], style: TextStyle(fontSize: 20)),
                    value: i,
                    groupValue: choice.value,
                    onChanged: (changed) {
                      setAnswer(answers[i][answers[i].length - 1], linkId);
                      choice.value = i;
                    },
                  ),
                ),
              );
            }
          }
        }
        break;
      case ItemControl.slider:
        {
          if (answers.isNotEmpty) {
            var first = double.tryParse(answers.first[1]) ?? 0;
            var last = double.tryParse(answers.last[1]) ?? 10;
            options.add(Obx(() => Slider(
                  value: first,
                  min: first,
                  max: last,
                  divisions: (first - last).abs().toInt(),
                  onChanged: (changed) {
                    setAnswer(changed.toInt(), linkId);
                    choice.value = changed.toInt();
                  },
                )));
          }
        }
        break;
      default:
        {
          for (var i = 0; i < answers.length; i++) {
            if (answers.isNotEmpty) {
              options.add(
                Obx(
                  () => RadioListTile(
                    title: Text(answers[i][0], style: TextStyle(fontSize: 20)),
                    value: i,
                    groupValue: choice.value,
                    onChanged: (changed) {
                      setAnswer(answers[i][answers[i].length - 1], linkId);
                      choice.value = i;
                    },
                  ),
                ),
              );
            }
          }
        }
        break;
    }

    return Column(children: options);
  }
}
