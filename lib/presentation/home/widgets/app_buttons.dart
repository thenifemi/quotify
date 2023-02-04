import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.label,
  });

  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.dark.withOpacity(0.08),
          foregroundColor: AppColors.dark,
        ),
        child: AutoSizeText(
          label,
          style: themeData.textTheme.bodySmall,
        ),
      ),
    );
  }
}
