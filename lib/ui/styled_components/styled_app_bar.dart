import 'package:amia_flutter_103/ui/views/settings/settings_dialog.dart';
import 'package:flutter/material.dart';

class StyledAppBar extends AppBar {
  StyledAppBar(BuildContext context, {String? title})
      : super(centerTitle: true, title: _AppBarTitle(title: title), actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => settingsDialog(context))
        ]);
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({Key? key, String? title})
      : this.title = title ?? 'AMIA Sandboxes',
        super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headline4);
  }
}
