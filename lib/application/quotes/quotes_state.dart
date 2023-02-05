part of 'quotes_bloc.dart';

@freezed
class QuotesState with _$QuotesState {
  const factory QuotesState({
    required bool isLoading,
    required Option<Either<Failure, Quotes>> failureOrResponseOption,
  }) = _QuotesState;

  factory QuotesState.initial() => QuotesState(
        isLoading: false,
        failureOrResponseOption: none(),
      );
}
