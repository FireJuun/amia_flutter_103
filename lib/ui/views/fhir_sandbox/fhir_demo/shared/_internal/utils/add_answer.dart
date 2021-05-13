import 'package:fhir/r4.dart';

void addAnswer(
  String answer,
  QuestionnaireResponseItem responseAnswer,
  QuestionnaireItem? _currentItem,
  bool remove,
) {
  switch (_currentItem?.type) {
    case QuestionnaireItemType.boolean:
      {
        responseAnswer.answer!.add(QuestionnaireResponseAnswer(
            valueBoolean: Boolean(answer.toString())));
      }
      break;
    case QuestionnaireItemType.integer:
      {
        responseAnswer.answer!.add(QuestionnaireResponseAnswer(
            valueInteger: Integer(answer.toString())));
      }
      break;
    case QuestionnaireItemType.decimal:
      {
        responseAnswer.answer!.add(QuestionnaireResponseAnswer(
            valueDecimal: Decimal(answer.toString())));
      }
      break;
    case QuestionnaireItemType.text:
      {
        responseAnswer.answer!
            .add(QuestionnaireResponseAnswer(valueString: answer.toString()));
      }
      break;
    case QuestionnaireItemType.string:
      {
        responseAnswer.answer!
            .add(QuestionnaireResponseAnswer(valueString: answer.toString()));
      }
      break;
    case QuestionnaireItemType.date:
      {
        responseAnswer.answer!.add(
            QuestionnaireResponseAnswer(valueDate: Date(answer.toString())));
      }
      break;
    case QuestionnaireItemType.datetime:
      {
        responseAnswer.answer!.add(QuestionnaireResponseAnswer(
            valueDateTime: FhirDateTime(answer.toString())));
      }
      break;
    case QuestionnaireItemType.time:
      {
        responseAnswer.answer!.add(
            QuestionnaireResponseAnswer(valueTime: Time(answer.toString())));
      }
      break;
    case QuestionnaireItemType.choice:
      {
        if (remove) {
          responseAnswer.answer!.remove(_getQuestionnaireResponseAnswer(
              _currentItem!.answerOption!, answer));
        } else {
          responseAnswer.answer!.add(_getQuestionnaireResponseAnswer(
              _currentItem!.answerOption!, answer));
        }
      }
      break;
    default:
      print(_currentItem?.type);
      break;
  }
}

QuestionnaireResponseAnswer _getQuestionnaireResponseAnswer(
        List<QuestionnaireAnswerOption> answerOptions, String answer) =>
    QuestionnaireResponseAnswer(
      valueCoding: answerOptions.indexWhere((element) =>
                  element.valueCoding?.code.toString() == answer) ==
              -1
          ? null
          : answerOptions
              .firstWhere(
                  (element) => element.valueCoding?.code.toString() == answer)
              .valueCoding!,
      valueString: answerOptions
                  .indexWhere((element) => element.valueString == answer) ==
              -1
          ? null
          : answerOptions
              .firstWhere((element) => element.valueString == answer)
              .valueString!,
      valueInteger: answerOptions.indexWhere(
                  (element) => element.valueInteger.toString() == answer) ==
              -1
          ? null
          : answerOptions
              .firstWhere(
                  (element) => element.valueInteger.toString() == answer)
              .valueInteger!,
      valueDate: answerOptions.indexWhere(
                  (element) => element.valueDate.toString() == answer) ==
              -1
          ? null
          : answerOptions
              .firstWhere((element) => element.valueDate.toString() == answer)
              .valueDate!,
      valueTime: answerOptions.indexWhere(
                  (element) => element.valueTime.toString() == answer) ==
              -1
          ? null
          : answerOptions
              .firstWhere((element) => element.valueTime.toString() == answer)
              .valueTime!,
      valueReference: answerOptions.indexWhere(
                  (element) => element.valueReference?.display == answer) ==
              -1
          ? null
          : answerOptions
              .firstWhere(
                  (element) => element.valueReference?.display == answer)
              .valueReference!,
    );
