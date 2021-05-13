import 'package:amia_flutter_103/ui/styled_components/styled_components.dart';
import 'package:amia_flutter_103/ui/views/fhir_sandbox/fhir_demo/shared/_internal/constants/constants.dart';
import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views.dart';

class HomeView extends StatelessWidget {
  Widget buildIcon(IconData icon, BuildContext context) => Icon(
        icon,
        color: Theme.of(context).textTheme.bodyText1?.color,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StyledButtonLarge(
              onPressed: () => Get.to(LayoutSandboxView()),
              title: '1. Layouts',
              trailing: buildIcon(Icons.dashboard, context),
            ),
            StyledButtonLarge(
              onPressed: () => Get.to(CounterSandboxView()),
              title: '2. Counters',
              trailing: buildIcon(Icons.add_circle_outline, context),
            ),
            StyledButtonLarge(
              onPressed: () => Get.to(FhirSandboxView(),
                  arguments: [Questionnaire.fromJson(fhirDemoJson)]),
              title: '3. FHIR',
              trailing: buildIcon(Icons.local_fire_department, context),
            ),
            StyledButtonLarge(
              onPressed: () => Get.to(LiveShareSandboxView(),
                  arguments: [Questionnaire.fromJson(fhirLiveshareJson)]),
              title: '4. LiveShare',
              trailing: buildIcon(Icons.screen_share, context),
            ),
          ],
        ),
      ),
    );
  }
}
