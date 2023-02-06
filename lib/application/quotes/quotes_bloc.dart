import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

import '../../domain/quotes/failure.dart';
import '../../domain/quotes/quotes.dart';
import '../../domain/quotes/quotes_interface.dart';

part 'quotes_bloc.freezed.dart';
part 'quotes_event.dart';
part 'quotes_state.dart';

@injectable
class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final QuotesInterface quotesInterface;

  QuotesBloc(this.quotesInterface) : super(QuotesState.initial()) {
    on<GetQuotes>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          failureOrResponseOption: none(),
        ),
      );

      final quotesBox = await Hive.openBox<Quotes>('quotes');

      if (quotesBox.isEmpty) {
        final failureOrResponse = await quotesInterface.getQuotes();
        emit(
          state.copyWith(
            isLoading: false,
            failureOrResponseOption: some(failureOrResponse),
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            failureOrResponseOption: some(right(
              quotesBox.get('quotes')!,
            )),
          ),
        );
      }
    });

    on<FavQuote>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          failureOrResponseOption: none(),
        ),
      );

      final quotesBox = await Hive.openBox<Quotes>('quotes');

      final quotes = quotesBox.get('quotes');
      quotes?.results.singleWhere((quote) => quote.id == event.id).faved = true;
      quotes?.save();

      emit(
        state.copyWith(
          isLoading: false,
          failureOrResponseOption: some(right(quotes!)),
        ),
      );
    });

    on<UnFavQuote>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          failureOrResponseOption: none(),
        ),
      );

      final quotesBox = await Hive.openBox<Quotes>('quotes');

      final quotes = quotesBox.get('quotes');
      quotes?.results.singleWhere((quote) => quote.id == event.id).faved =
          false;
      quotes?.save();

      emit(
        state.copyWith(
          isLoading: false,
          failureOrResponseOption: some(right(quotes!)),
        ),
      );
    });

    on<EditQuote>((event, emit) async {});

    on<DeleteQuote>((event, emit) async {});
  }
}
