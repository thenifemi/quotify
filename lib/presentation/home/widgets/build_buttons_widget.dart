import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/quotes/quotes_bloc.dart';
import '../../../domain/quotes/quotes.dart';
import '../../core/components/app_buttons.dart';

Widget buildButtons(
  ValueNotifier<bool> isEditing,
  TextEditingController textController,
  Result quote,
  BuildContext context,
) {
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
                        context.read<QuotesBloc>().add(UnFavQuote(quote.id));
                        context.router.pop();
                      },
                      label: "💔 UnFav",
                    )
                  : AppButton(
                      onPressed: () {
                        context.read<QuotesBloc>().add(FavQuote(quote.id));
                        context.router.pop();
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
                  context.router.pop();
                },
                label: "🗑️ Delete",
              ),
            ],
          ),
  );
}
