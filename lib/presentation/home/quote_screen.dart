import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../application/quotes/quotes_bloc.dart';
import '../../domain/quotes/quotes.dart';
import '../core/app_colors.dart';
import '../core/theme.dart';
import 'widgets/app_buttons.dart';
import 'widgets/app_textfields.dart';

class QuoteScreen extends HookWidget {
  const QuoteScreen({super.key, required this.quote});

  final Result quote;

  @override
  Widget build(BuildContext context) {
    final isEditing = useState<bool>(false);
    final textController = useTextEditingController(text: quote.content);

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
                      context
                          .read<QuotesBloc>()
                          .add(EditQuote(quote.id, textController.text));

                      isEditing.value = false;
                    },
                    label: "💾 Save",
                  ),
                ],
              )
            : Row(
                key: UniqueKey(),
                children: [
                  quote.faved == true
                      ? AppButton(
                          onPressed: () {
                            context
                                .read<QuotesBloc>()
                                .add(UnFavQuote(quote.id));
                            context.router.pop("faved");
                          },
                          label: "💔 UnFav",
                        )
                      : AppButton(
                          onPressed: () {
                            context.read<QuotesBloc>().add(FavQuote(quote.id));
                            context.router.pop("faved");
                          },
                          label: "💕 Fav",
                        ),
                  const SizedBox(width: 10),
                  AppButton(
                    onPressed: () {
                      isEditing.value = true;
                    },
                    label: "🖋️ Edit",
                  ),
                  const SizedBox(width: 10),
                  AppButton(
                    onPressed: () {
                      context.read<QuotesBloc>().add(DeleteQuote(quote.id));
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

    return BlocBuilder<QuotesBloc, QuotesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
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
      },
    );
  }
}
