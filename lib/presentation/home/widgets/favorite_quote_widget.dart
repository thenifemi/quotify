import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../domain/quotes/quotes.dart';
import '../../core/app_colors.dart';
import '../../core/theme.dart';
import '../../routes/router.gr.dart';

class FavoriteQuoteWidget extends StatelessWidget {
  const FavoriteQuoteWidget({super.key, required this.quotes});

  final Quotes quotes;

  @override
  Widget build(BuildContext context) {
    final favQuote = quotes.results.firstWhere((quote) => quote.faved == true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Favorite quote 💕",
          style: themeData.textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: AppColors.dark.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: RawMaterialButton(
            onPressed: () async {
              final result = await context.router.push(
                const QuoteScreenRoute(),
              );
              print(result);
            },
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
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
                    "\"${favQuote.content}\" - ${favQuote.author}",
                    style: themeData.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
