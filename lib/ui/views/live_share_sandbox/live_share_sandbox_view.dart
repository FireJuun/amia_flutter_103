import 'package:amia_flutter_103/ui/styled_components/styled_components.dart';
import 'package:amia_flutter_103/ui/views/fhir_sandbox/fhir_demo/shared/ui/survey_view.dart';
import 'package:flutter/material.dart';

class LiveShareSandboxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(context, title: 'LiveShare Sandbox'),
      body: SurveyView(),
    );
  }
}
