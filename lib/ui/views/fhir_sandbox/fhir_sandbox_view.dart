import 'package:amia_flutter_103/ui/styled_components/styled_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fhir_sandbox_controller.dart';
import 'sdc_demo.dart';

class FhirSandboxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FhirSandboxController>(
      init: FhirSandboxController(),
      builder: (controller) {
        return Scaffold(
          appBar: StyledAppBar(context, title: 'FHIR Sandbox'),
          body: SdcDemo(),
        );
      },
    );
  }
}
