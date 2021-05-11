import 'package:amia_flutter_103/ui/styled_components/styled_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views.dart';

class HomeView extends StatelessWidget {
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
              title: 'Layout',
            ),
            StyledButtonLarge(
              onPressed: () => Get.to(CounterSandboxView()),
              title: 'Counter',
            ),
            Divider(
              thickness: 4,
              color: Colors.black54,
            ),
            StyledButtonLarge(
              onPressed: () => Get.to(FhirSandboxView()),
              title: 'FHIR',
            ),
            StyledButtonLarge(
              onPressed: () => Get.to(LiveShareSandboxView()),
              title: 'LiveShare',
            ),
          ],
        ),
      ),
    );
  }
}
