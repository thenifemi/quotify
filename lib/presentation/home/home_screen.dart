import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/quotes/quotes_bloc.dart';
import '../../domain/quotes/quotes.dart';
import '../core/app_colors.dart';
import '../core/components/app_buttons.dart';
import '../core/theme.dart';
import 'widgets/all_quotes_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void handleReset() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.dark,
            title: Text(
              "🌍 Reset Quotes?",
              style: themeData.textTheme.bodyMedium?.copyWith(
                color: AppColors.primary,
              ),
            ),
            content: Text(
              "This will delete all current data (faved, edited, deleted quotes) from your device and replace them with freshly baked quotes from the internet?",
              style: themeData.textTheme.bodyMedium?.copyWith(
                color: AppColors.primary,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Don't reset",
                  style: themeData.textTheme.bodyMedium?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<QuotesBloc>().add(GetQuotes(resetQuotes: true));
                  Navigator.pop(context);
                },
                child: Text(
                  "Reset",
                  style: themeData.textTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    return BlocConsumer<QuotesBloc, QuotesState>(
      listener: (context, state) {
        state.action?.fold(() {}, (action) {
          String actionMessage() {
            switch (action) {
              case QuoteAction.faved:
                return "💕 Quote faved!";

              case QuoteAction.unfaved:
                return "💔 Quote unfaved!";

              case QuoteAction.edited:
                return "✍🏼 Quote edited!";

              case QuoteAction.deleted:
                return "🗑️ Quote deleted!";

              default:
                return "No action";
            }
          }

          Flushbar(
            messageText: Text(
              actionMessage(),
              style: themeData.textTheme.bodyMedium?.copyWith(
                color: AppColors.primary,
              ),
            ),
            borderRadius: BorderRadius.circular(10),
            flushbarPosition: FlushbarPosition.TOP,
            flushbarStyle: FlushbarStyle.FLOATING,
            duration: const Duration(seconds: 4),
            margin: const EdgeInsets.all(20),
            backgroundColor: AppColors.dark,
          ).show(context);
        });
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                AutoSizeText(
                  "📜 Quotify",
                  style: themeData.textTheme.titleLarge,
                ),
                const Spacer(),
                AppButton(
                  onPressed: handleReset,
                  label: "🌍 Reset!",
                ),
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: state.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.dark.withOpacity(0.4),
                      color: AppColors.dark,
                    ),
                  )
                : state.failureOrResponseOption.fold(
                    () => Container(),
                    (either) => either.fold(
                      (_) => Center(
                        child: AutoSizeText(
                          "😪 Uh oh! An error occurred!",
                          style: themeData.textTheme.bodyMedium,
                        ),
                      ),
                      (response) {
                        return AllQuotesWidget(quotes: response);
                      },
                    ),
                  ),
          ),
        );
      },
    );
  }
}
