import 'package:flutter/material.dart';

class TextResponse extends StatelessWidget {
  TextResponse(
    this.setAnswer,
    List<String> initialAnswer,
    this.linkId,
    String? hint,
  ) {
    controller = TextEditingController(
        text: initialAnswer.isEmpty ? null : initialAnswer[0]);
    this.hint = hint ?? 'Please write';
  }

  final Function setAnswer;
  late final TextEditingController controller;
  final String? linkId;
  late final String hint;

  @override
  Widget build(BuildContext context) => TextFormField(
        decoration: InputDecoration(
          hintText: hint,
        ),
        controller: controller,
        onChanged: (text) => setAnswer(text, linkId),
      );
}
