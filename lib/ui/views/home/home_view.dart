import 'package:amia_flutter_103/ui/styled_components/styled_components.dart';
import 'package:flutter/material.dart';

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
              onPressed: () {},
              title: 'Layout',
            ),
            StyledButtonLarge(
              onPressed: () {},
              title: 'FHIR',
            ),
            StyledButtonLarge(
              onPressed: () {},
              title: 'LiveShare',
            ),
          ],
        ),
      ),
    );
  }
}
