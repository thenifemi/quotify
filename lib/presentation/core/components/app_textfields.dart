import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../theme.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({
    this.onChanged,
    this.controller,
    super.key,
  });

  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      onChanged: onChanged,
      cursorColor: AppColors.dark,
      maxLines: 3,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        fillColor: AppColors.dark.withOpacity(0.08),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.dark,
            width: 0.6,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.dark,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      keyboardType: TextInputType.text,
      style: themeData.textTheme.bodyMedium,
    );
  }
}
