import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/quotes/quotes_bloc.dart';
import '../../domain/quotes/quotes.dart';
import '../core/app_colors.dart';
import '../core/theme.dart';
import 'widgets/all_quotes_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuotesBloc, QuotesState>(
      listener: (context, state) {
        state.action?.fold(() {}, (action) {
          String actionMessage() {
            switch (action) {
              case QuoteAction.faved:
                return "💕 Quote faved!";

              case QuoteAction.unfaved:
                return "💕 Quote unfaved!";

              case QuoteAction.edited:
                return "💕 Quote edited!";

              case QuoteAction.deleted:
                return "💕 Quote deleted!";

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
            title: AutoSizeText(
              "📜 Quotify",
              style: themeData.textTheme.titleLarge,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: double.infinity,
            child: state.failureOrResponseOption.fold(
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
