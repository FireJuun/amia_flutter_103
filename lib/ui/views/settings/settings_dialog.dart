import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:amia_flutter_103/controllers/controllers.dart';

Future<void> settingsDialog(BuildContext context) async => showDialog<void>(
      context: context,
      builder: (BuildContext context) => _SettingsDialogContent(),
    );

class _SettingsDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Change Theme')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _SettingsThemeModeTile(
            title: 'Light Mode',
            newThemeMode: ThemeMode.light,
          ),
          _SettingsThemeModeTile(
            title: 'Dark Mode',
            newThemeMode: ThemeMode.dark,
          ),
          _SettingsThemeModeTile(
            title: 'System Default',
            newThemeMode: ThemeMode.system,
          ),
        ],
      ),
    );
  }
}

class _SettingsThemeModeTile extends StatelessWidget {
  const _SettingsThemeModeTile(
      {Key? key, String? title, required this.newThemeMode})
      : title = title ?? '',
        super(key: key);

  final String title;
  final ThemeMode newThemeMode;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return ListTile(
      onTap: () => themeController.setThemeMode(newThemeMode),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1?.apply(
            fontWeightDelta:
                (themeController.themeMode == newThemeMode) ? 3 : 0,
            decoration: (themeController.themeMode == newThemeMode)
                ? TextDecoration.underline
                : null),
      ),
    );
  }
}
