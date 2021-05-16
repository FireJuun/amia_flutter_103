import 'package:amia_flutter_103/ui/styled_components/styled_bottom_nav_bar_controller.dart';
import 'package:amia_flutter_103/ui/styled_components/styled_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fhir_demo/fhir_demo_view.dart';
import 'sdc_demo.dart';
import 'sdc_demo_controller.dart';

// todo: combine _tabList and _tabViews into one model
// todo: change previous/next to _tabList in StyledBottomNavBar

const _CONTROLLER_ID = 'FHIR_SANDBOX';
final _tabList = <String, Function>{
  'Survey': () {},
  'SDC Demo': () {},
};
final _tabViews = <StatelessWidget>[
  FhirDemoView(),
  SdcDemo(),
];

class FhirSandboxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SdcDemoController());

    // *** MAKE SURE YOU CALL THIS BEFORE USING StyledBottomNavBar ***
    final controller = Get.put(StyledBottomNavBarController(tabList: _tabList),
        tag: _CONTROLLER_ID);

    return Scaffold(
      appBar: StyledAppBar(context, title: 'FHIR Sandbox'),
      body: TabBarView(
        controller: controller.tabController,
        children: _tabViews,
      ),
      bottomNavigationBar: StyledBottomNavBar(
        controllerId: _CONTROLLER_ID,
        tabList: _tabList,
      ),
    );
  }
}
