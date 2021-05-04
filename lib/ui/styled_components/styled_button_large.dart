import 'package:flutter/material.dart';

class StyledButtonLarge extends StatelessWidget {
  const StyledButtonLarge({Key? key, required this.onPressed, String? title})
      : title = title ?? '',
        super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          alignment: Alignment.center,
          child: Text(
            title,
            style: Theme.of(context).accentTextTheme.headline4,
          ),
        ),
      ),
    );
  }
}
