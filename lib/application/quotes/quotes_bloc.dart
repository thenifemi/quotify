import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/quotes/failure.dart';
import '../../domain/quotes/quotes.dart';
import '../../domain/quotes/quotes_interface.dart';

part 'quotes_bloc.freezed.dart';
part 'quotes_event.dart';
part 'quotes_state.dart';

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

      final failureOrResponse = await quotesInterface.getQuotes();

      emit(
        state.copyWith(
          isLoading: false,
          failureOrResponseOption: some(failureOrResponse),
        ),
      );
    });
  }
}
