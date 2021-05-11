import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'styled_bottom_nav_bar_controller.dart';

class StyledBottomNavBar extends StatelessWidget {
  const StyledBottomNavBar(
      {Key? key, required this.controllerId, required this.tabList})
      : super(key: key);

  final String controllerId;
  final Map<String, Function> tabList;

  @override
  Widget build(BuildContext context) {
    // NOTE: Make sure you call get.put in the view before this one

    return GetX<StyledBottomNavBarController>(
      // init: StyledBottomNavBarController(tabList: tabList),
      tag: controllerId,
      builder: (controller) {
        return BottomAppBar(
          color: Theme.of(context).primaryColor,
          child: Container(
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Previous
                Expanded(
                  child: TextButton.icon(
                    onPressed: controller.isTabIndexAtStart()
                        ? null
                        : () => controller.tabController.index--,
                    icon: const Icon(Icons.navigate_before),
                    label: Text('Previous'),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                // Next
                Expanded(
                  child: TextButton.icon(
                    onPressed: controller.isTabIndexAtEnd()
                        ? null
                        : () => controller.tabController.index++,
                    icon: const Icon(Icons.navigate_next),
                    label: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
