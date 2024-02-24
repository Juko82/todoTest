import 'package:flutter/material.dart';

class SettingsLitTile extends StatelessWidget {
  const SettingsLitTile({
    super.key,
    required this.val,
    required this.title,
    required this.onChanged,
  });

  final String title;
  final bool val;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
      title: Text(
        title,
        style: theme.textTheme.labelSmall,
      ),
      trailing: Switch(
          value: val,
          onChanged: (val) {
            onChanged(val);
          }),
    );
  }
}