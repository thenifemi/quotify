import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../domain/quotes/quotes.dart';
import '../../core/app_colors.dart';
import '../../core/theme.dart';
import '../../routes/router.gr.dart';

class AllQuotesWidget extends StatelessWidget {
  const AllQuotesWidget({super.key, required this.quotes});

  final Quotes quotes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: quotes.results.length,
            itemBuilder: (context, index) {
              final quote = quotes.results[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: AppColors.dark.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: RawMaterialButton(
                  onPressed: () async {
                    await context.router.push(
                      QuoteScreenRoute(quote: quote),
                    );
                  },
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          AutoSizeText(
                            "📜",
                            style: themeData.textTheme.titleLarge,
                          ),
                          if (quote.faved == true)
                            AutoSizeText(
                              "💕",
                              style: themeData.textTheme.titleLarge,
                            ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AutoSizeText(
                          "\"${quote.content}\" - ${quote.author}",
                          style: themeData.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
