import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../domain/quotes/quotes.dart';
import '../../core/app_colors.dart';
import '../../core/components/app_textfields.dart';
import '../../core/theme.dart';

Widget buildQuote(
  ValueNotifier<bool> isEditing,
  TextEditingController textController,
  Result quote,
) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    child: isEditing.value
        ? Column(
            key: UniqueKey(),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "🖋️ Edit quote",
                style: themeData.textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              AppTextfield(
                controller: textController,
              ),
            ],
          )
        : Column(
            key: UniqueKey(),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "🧔🏽‍♂️ By ${quote.author}",
                style: themeData.textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: AppColors.dark.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "📜",
                      style: themeData.textTheme.titleLarge,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AutoSizeText(
                        "\"${quote.content}\"",
                        style: themeData.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
  );
}
