import 'package:fhir/r4.dart';

/// https://www.hl7.org/fhir/valueset-questionnaire-item-control.html
/// https://www.hl7.org/fhir/codesystem-questionnaire-item-control.html

final enumToItemControl = {
  ItemControl.group: group,
  ItemControl.list: list,
  ItemControl.table: table,
  ItemControl.htable: htable,
  ItemControl.gtable: gtable,
  ItemControl.atable: atable,
  ItemControl.header: header,
  ItemControl.footer: footer,
  ItemControl.text: text,
  ItemControl.inline: inline,
  ItemControl.prompt: prompt,
  ItemControl.unit: unit,
  ItemControl.lower: lower,
  ItemControl.upper: upper,
  ItemControl.flyover: flyover,
  ItemControl.help: help,
  ItemControl.question: question,
  ItemControl.autocomplete: autocomplete,
  ItemControl.drop_down: dropDown,
  ItemControl.check_box: checkBox,
  ItemControl.lookup: lookup,
  ItemControl.radio_button: radioButton,
  ItemControl.slider: slider,
  ItemControl.spinner: spinner,
  ItemControl.text_box: textBox,
};

final itemControlToEnum = {
  dropDown: ItemControl.drop_down,
  checkBox: ItemControl.check_box,
  radioButton: ItemControl.radio_button,
  slider: ItemControl.slider,
  spinner: ItemControl.spinner,
  group: ItemControl.group,
  list: ItemControl.list,
  table: ItemControl.table,
  htable: ItemControl.htable,
  gtable: ItemControl.gtable,
  atable: ItemControl.atable,
  header: ItemControl.header,
  footer: ItemControl.footer,
  text: ItemControl.text,
  inline: ItemControl.inline,
  prompt: ItemControl.prompt,
  unit: ItemControl.unit,
  lower: ItemControl.lower,
  upper: ItemControl.upper,
  flyover: ItemControl.flyover,
  help: ItemControl.help,
  question: ItemControl.question,
  autocomplete: ItemControl.autocomplete,
  lookup: ItemControl.lookup,
  textBox: ItemControl.text_box,
};

enum ItemControl {
  group,
  list,
  table,
  htable,
  gtable,
  atable,
  header,
  footer,
  text,
  inline,
  prompt,
  unit,
  lower,
  upper,
  flyover,
  help,
  question,
  autocomplete,
  drop_down,
  check_box,
  lookup,
  radio_button,
  slider,
  spinner,
  text_box,
}

final group = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('group'),
        display: 'Group',
      )
    ]));

final list = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('list'),
        display: 'List',
      )
    ]));

final table = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('table'),
        display: 'Vertical Answer Table',
      )
    ]));

final htable = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('htable'),
        display: 'Horizontal Answer Table',
      )
    ]));

final gtable = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('gtable'),
        display: 'Group Table',
      )
    ]));

final atable = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('atable'),
        display: 'Answer Table',
      )
    ]));

final header = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('header'),
        display: 'Header',
      )
    ]));

final footer = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('footer'),
        display: 'Footer',
      )
    ]));

final text = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('text'),
        display: '',
      )
    ]));

final inline = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('inline'),
        display: 'In-line',
      )
    ]));

final prompt = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('prompt'),
        display: 'Prompt',
      )
    ]));

final unit = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('unit'),
        display: 'Unit',
      )
    ]));

final lower = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('lower'),
        display: 'Lower-bound',
      )
    ]));

final upper = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('upper'),
        display: 'Upper-bound',
      )
    ]));

final flyover = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('flyover'),
        display: 'Fly-over',
      )
    ]));

final help = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('help'),
        display: 'Help-Button',
      )
    ]));

final question = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('question'),
        display: '',
      )
    ]));

final autocomplete = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('autocomplete'),
        display: 'Auto-complete',
      )
    ]));

final dropDown = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('drop-down'),
        display: 'Drop down',
      )
    ]));

final checkBox = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('check-box'),
        display: 'Check-box',
      )
    ]));

final lookup = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('lookup'),
        display: 'Lookup',
      )
    ]));

final radioButton = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('radio-button'),
        display: 'Radio Button',
      )
    ]));

final slider = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('slider'),
        display: 'Slider',
      )
    ]));

final spinner = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('spinner'),
        display: 'Spinner',
      )
    ]));

final textBox = FhirExtension(
    url: FhirUri(
        'http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl'),
    valueCodeableConcept: CodeableConcept(coding: [
      Coding(
        system: FhirUri('http://hl7.org/fhir/questionnaire-item-control'),
        code: Code('text-box'),
        display: 'Text Box',
      )
    ]));
