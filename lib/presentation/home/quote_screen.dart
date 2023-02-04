import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../core/app_colors.dart';
import '../core/theme.dart';
import 'widgets/app_buttons.dart';
import 'widgets/app_textfields.dart';

class QuoteScreen extends HookWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isEditing = useState<bool>(false);
    final textController = useTextEditingController();

    Widget buildButtons() {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isEditing.value
            ? Row(
                key: UniqueKey(),
                children: [
                  AppButton(
                    onPressed: () {
                      isEditing.value = false;
                    },
                    label: "❌ Cancel",
                  ),
                  const SizedBox(width: 10),
                  AppButton(
                    onPressed: () {
                      isEditing.value = false;
                    },
                    label: "💾 Save",
                  ),
                ],
              )
            : Row(
                key: UniqueKey(),
                children: [
                  AppButton(
                    onPressed: () {
                      context.router.pop("faved");
                    },
                    label: "💕 Fav",
                  ),
                  const SizedBox(width: 10),
                  AppButton(
                    onPressed: () {
                      isEditing.value = true;
                      textController.text =
                          "The true meaning of life is to plant trees, under whose shade you do not expect to sit.";
                    },
                    label: "🖋️ Edit",
                  ),
                  const SizedBox(width: 10),
                  AppButton(
                    onPressed: () {
                      context.router.pop("deleted");
                    },
                    label: "🗑️ Delete",
                  ),
                ],
              ),
      );
    }

    Widget buildQuote() {
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
                    "🧔🏽‍♂️ By Socrates",
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
                            "\"The true meaning of life is to plant trees, under whose shade you do not expect to sit.\"",
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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: AutoSizeText(
          "📜 Quotify",
          style: themeData.textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildQuote(),
            const SizedBox(height: 10),
            buildButtons(),
          ],
        ),
      ),
    );
  }
}
