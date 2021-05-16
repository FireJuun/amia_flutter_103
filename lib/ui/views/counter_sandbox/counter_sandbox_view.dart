import 'package:amia_flutter_103/ui/styled_components/styled_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_sandbox_controller.dart';

class CounterSandboxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CounterSandboxController>(
      init: CounterSandboxController(),
      builder: (controller) {
        return Scaffold(
          appBar: StyledAppBar(context, title: 'Counters Sandbox'),
          body: Center(
            child: Text(
              'Button Pressed:\n${controller.counter} times',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => controller.counter.value++,
          ),
        );
      },
    );
  }
}
