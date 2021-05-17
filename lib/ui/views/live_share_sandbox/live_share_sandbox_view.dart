import 'package:amia_flutter_103/ui/styled_components/styled_bottom_nav_bar_controller.dart';
import 'package:amia_flutter_103/ui/styled_components/styled_components.dart';
import 'package:amia_flutter_103/ui/views/fhir_sandbox/fhir_demo/shared/controllers/survey_controller.dart';
import 'package:amia_flutter_103/ui/views/fhir_sandbox/fhir_demo/shared/ui/survey_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fhir_puns.dart';

const _CONTROLLER_ID = 'LIVE_SHARE_SANDBOX';
final _tabList = <String, Function>{
  'FHIR Puns': () {},
  'FHIR Pun Survey': () {},
};
final _tabViews = <StatelessWidget>[
  FhirPuns(),
  SurveyView(),
];

class LiveShareSandboxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // *** MAKE SURE YOU CALL THIS BEFORE USING StyledBottomNavBar ***
    final controller = Get.put(StyledBottomNavBarController(tabList: _tabList),
        tag: _CONTROLLER_ID);
    Get.put(SurveyController());

    return Scaffold(
      appBar: StyledAppBar(context, title: 'LiveShare Sandbox'),
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
