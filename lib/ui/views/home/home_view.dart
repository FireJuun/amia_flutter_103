import 'package:amia_flutter_103/controllers/controllers.dart';
import 'package:amia_flutter_103/ui/styled_components/styled_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('AMIA Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StyledButtonLarge(
              onPressed: () => themeController.setThemeMode(ThemeMode.light),
              title: 'Light Mode',
            ),
            StyledButtonLarge(
              onPressed: () => themeController.setThemeMode(ThemeMode.dark),
              title: 'Dark Mode',
            ),
            StyledButtonLarge(
              onPressed: () => themeController.setThemeMode(ThemeMode.system),
              title: 'System Default',
            ),
          ],
        ),
      ),
    );
  }
}
