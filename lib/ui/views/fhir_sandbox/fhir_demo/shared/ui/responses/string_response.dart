import 'package:flutter/material.dart';

class StringResponse extends StatelessWidget {
  StringResponse(this.setAnswer, List<String> initialAnswer, this.linkId) {
    controller = TextEditingController(
        text: initialAnswer.isEmpty ? null : initialAnswer[0]);
  }

  final Function setAnswer;
  late final TextEditingController controller;
  final String? linkId;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        onChanged: (text) => setAnswer(text, linkId),
        style: const TextStyle(fontSize: 20),
      );
}
