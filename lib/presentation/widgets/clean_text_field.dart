import 'package:flutter/material.dart';
import 'package:testing_app/core/constants/app_color.dart';
import 'package:testing_app/generated/l10n.dart';
import 'package:testing_app/utils/size/app_size.dart';

class CleanTextField extends StatelessWidget {
  final TextEditingController controller;
  const CleanTextField({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextField(
      controller: controller,
      maxLines: 2,
      
      style: TextStyle(fontSize: AppSize.size20, color: theme.hintColor),
      decoration:  InputDecoration(
        
        hintText: S.of(context).inputTask,
        hintStyle: TextStyle(color: theme.hintColor),
        contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
