import 'package:flutter/material.dart';

class StyledButtonLarge extends StatelessWidget {
  const StyledButtonLarge(
      {Key? key, this.onPressed, this.leading, this.trailing, String? title})
      : this.title = title ?? '',
        super(key: key);

  final String title;
  final Widget? trailing;
  final Widget? leading;
  final VoidCallback? onPressed;

  List<Widget> buildChildren(BuildContext context) {
    final builder = <Widget>[];
    if (leading != null) {
      builder.add(leading!);
    }
    builder.add(
      Text(title, style: Theme.of(context).textTheme.headline5),
    );

    if (trailing != null) {
      builder.add(trailing!);
    }
    return builder;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buildChildren(context),
          ),
        ),
      ),
    );
  }
}
